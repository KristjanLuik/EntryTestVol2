app.controller('QuestionsController', ['$scope',QuestionsController]);

function QuestionsController($scope){

    $scope.answers = [1];
    var asi = 'utf8=%E2%9C%93&authenticity_token=tPAkO0uW6CyP%2Bxve%2BV21JcVWunbmtuwqaO6iH6x6CE0%3D&question%5Bcontent%5D=Kysimuse+kast&question%5Bdifficulty%5D=kerge&question%5Bmin_options%5D=&question%5Bmax_options%5D=&question%5Bmin_correct%5D=&question%5Bmax_correct%5D=&question%5Bstatus%5D=Kinnitamata&question%5Blabels_attributes%5D%5B0%5D%5Bname%5D=&question%5Banswers_attributes%5D%5B0%5D%5B_destroy%5D=0&question%5Banswers_attributes%5D%5B0%5D%5Bcontent%5D=vastus1&question%5Banswers_attributes%5D%5B0%5D%5Bpoints%5D=&question%5Banswers_attributes%5D%5B0%5D%5Bcorrect%5D=0&answer%5Bcontent%5D=vastus2&answer%5Bpoints%5D=';
    $scope.saada = function() {
        console.log("Olen vajutatud");
        $.ajax({
            url: '/answers',
            type: 'POST',
            data: asi, /*$('#new_post').serialize(),*/
            success: function(response){
                console.log('Laks edukalt, respnsose:');
               // console.log(response);
            },
            error: function(jqXHR, textStatus, ex){
                alert(textStatus + "," + ex + "," + jqXHR.responseText);
                console.log("Laks halvasti");
            }
        });
        console.log($('#answers2').serialize());
/*        console.log('Ilma serita');
        console.log($('#new_question'));
        console.log('seriga');
        console.log($('#new_question').serialize());*/
    }

}