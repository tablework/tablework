class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  include PayPal::SDK::REST
  include PayPal::SDK::Core::Logging

  def show

  end

  def pay
  	#the pay one off example
	  @payment = Payment.new({
		  :intent =>  "sale",

		  # ###Payer
		  # A resource representing a Payer that funds a payment
		  # Payment Method as 'paypal'
		  :payer =>  {
		    :payment_method =>  "paypal" },

		  # ###Redirect URLs
		  :redirect_urls => {
		    :return_url => "http://localhost:3000/payments",
		    :cancel_url => "http://localhost:3000/" },

		  # ###Transaction
		  # A transaction defines the contract of a
		  # payment - what is the payment for and who
		  # is fulfilling it.
		  :transactions =>  [{

		    # Item List
		    :item_list => {
		      :items => [{
		        :name => "item",
		        :sku => "item",
		        :price => "69.99",
		        :currency => "USD",
		        :quantity => 1 }]},

		    # ###Amount
		    # Let's you specify a payment amount.
		    :amount =>  {
		      :total =>  "69.99",
		      :currency =>  "USD" },
		    :description =>  "This is the payment transaction description." }]})

	  if @payment.create
	    @redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
	    logger.info "Payment[#{@payment.id}]"
	    logger.info "Redirect: #{@redirect_url}"
	  else
	    # Display Error message
	    logger.error "Error while creating payment:"
	    logger.error @payment.error.inspect
	  end

	  redirect_to @redirect_url
  end

  def subscribe
  	  @planAttributes = {
  	    "name" => "Tablework Monthly Plan",
  	    "description" => "Template creation.",
  	    "type" => "infinite",
  	    "payment_definitions" => [
  	        {
  	            "name" => "Monthly Payments",
  	            "type" => "REGULAR",
  	            "frequency" => "MONTH",
  	            "frequency_interval" => "1",
  	            "amount" => {
  	                "value" => "6.99",
  	                "currency" => "USD"
  	            },
  	            "cycles" => "0",
  	            "charge_models" => [
  	                {
  	                    "type" => "SHIPPING",
  	                    "amount" => {
  	                        "value" => "6.99",
  	                        "currency" => "USD"
  	                    }
  	                },
  	                {
  	                    "type" => "TAX",
  	                    "amount" => {
  	                        "value" => "0.69",
  	                        "currency" => "USD"
  	                    }
  	                }
  	            ]
  	        }
  	    ],
  	    "merchant_preferences" => {
  	        "setup_fee" => {
  	            "value" => "1.00",
  	            "currency" => "USD"
  	        },
  	        "return_url" => "http://localhost:3000/payments",
  	        "cancel_url" => "http://localhost:3000/",
  	        "auto_bill_amount" => "YES",
  	        "initial_fail_amount_action" => "CONTINUE",
  	        "max_fail_attempts" => "0"
  	    }
  	  }

  	  @agreementAttributes = {
  	    "name" => "Tablework Subscription Agreement",
  	    "description" => "Agreement for T-Shirt of the Month Club Plan",
  	    "start_date" => "2015-02-19T00:37:04Z",
  	    "payer" => {
  	        "payment_method" => "paypal"
  	    },
  	    "shipping_address" => {
  	        "line1" => "111 First Street",
  	        "city" => "Saratoga",
  	        "state" => "CA",
  	        "postal_code" => "95070",
  	        "country_code" => "US"
  	    }
  	}

  	# first, create an active plan to be added to agreement
    api = API.new
    # plan = Plan.new(@planAttributes.merge( :token => api.token ))
    # plan.create

    # construct a patch object that will be used for deletion
    # patch = Patch.new
    # patch.op = "replace"
    # patch.path = "/"
    # patch.value = { "state" => "ACTIVE" }

    # send delete request
    # plan.update(patch)

    # first, create an agreement
    agreement = Agreement.new(@agreementAttributes)
    agreement.plan = Plan.find('P-90493608698168208O62BMJQ')
    agreement.create
  	# agreement.execute
  	binding.pry
  	redirect_to payments_path
  end

  def cancel
  	puts "CANCEL"
  	# create a plan to delete
  	plan = Plan.find(plan_id)
  	plan_id = plan.id

  	# construct a patch object that will be used for deletion
  	patch = Patch.new
  	patch.op = "replace"
  	patch.path = "/"
  	patch.value = { "state" => "DELETED" }

  	# send delete request
  	plan.update(patch)

  	# make sure the plan has been deleted
  	plan = Plan.find(plan_id)
  	plan.id.should_not eq plan_id
  	redirect_to payments_path
  end

end