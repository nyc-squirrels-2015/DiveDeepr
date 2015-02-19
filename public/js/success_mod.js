var successMod = (function(){

    var successDiv = "#success"
    var showSuccess = function(message){
      $(successDiv).text(message);
      $(successDiv).toggle(true);

    };

    var hideSuccess = function(){
      $(SuccessDiv).toggle(false);
    };

    return {
      show: showSuccess,
      hide: hideSuccess
    };
})();