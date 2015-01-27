$(function() {
    var dates=[];
    var thisDate = new Date();
    var yearVar = thisDate.getFullYear();
    while( yearVar > 1900 )
    {
        yearVar--;
        var json = {'title': yearVar.toString()}
        dates.push(json);
        // console.log(yearVar);
    }
    

    $('.ui.search')
      .search({
        source: dates
      })
    ;

});