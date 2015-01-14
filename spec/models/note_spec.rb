require 'rails_helper'

RSpec.describe Note, :type => :model do
  subject(:note) { build :note }

  it { is_expected.to respond_to :title  }
  it { is_expected.to respond_to :text  }
  it { is_expected.to respond_to :link  }
  it { is_expected.to respond_to :image  }
  it { is_expected.to respond_to :notable  }
end
