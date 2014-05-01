// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() { 

answers=$("#answers");
labels=$("#labels");
  $('#addInput').click(function(){  
     addInputs();
  });

  $('#added_labels input[type=text]').change(function(){
    addLabels();
  });
  $("#added_labels .delete input").change(function(){
  	$(this).parents("li").hide();
  })
  $("#added_labels .remove input").change(function(){
  	removeLabel($(this));
  });
	$('#added_labels .add_label input[type=text]').focus(function(){
    showLabels($(this).parent());
  });
 $(".change_label").click(function(){
 	showLabels($(this));
 })
});


function addInputs(){
    n = answers.children("p").length;

    var par=document.createElement("p");
    
    var text=document.createElement("textarea");
    text.name="question[answers_attributes]["+n+"][content]";
    text.placeholder="Answer text";
    par.appendChild(text);

    var br=document.createElement("br");
    par.appendChild(br);
    
    var points=document.createElement("input");
    points.type="number";
    points.size=4;
    points.placeholder="Points";
    points.name="question[answers_attributes]["+n+"][points]";
    par.appendChild(points);
    
    var label=document.createElement("label");
    label.for="question_answers_attributes_"+n+"_correct";
    label.innerHTML="Correct";
    par.appendChild(document.createTextNode(' '));
    par.appendChild(label);
    par.appendChild(document.createTextNode(' '));
    
    var correct=document.createElement("input");
    correct.type="checkbox";
    correct.name="question[answers_attributes]["+n+"][correct]";
    correct.id='question_answers_attributes_'+n+'_correct';
    par.appendChild(correct);
    
    answers.append(par);

}

function addLabels(){
	$("#existing_labels").hide();
	
	if ($("#added_labels>li:last-child input[type=text]").val() != "" ){
  		console.log("lisame");
    	m=$("#added_labels").children('li').length;
    
    	var li=document.createElement('li');
    	$(li).attr("class","add_label");
    
    	var input=document.createElement('input');
    	$(input).attr({
    		"type":"text", 
    		"name":'question[labels_attributes]['+m+'][name]', 
    		"class":"q_label"})
    	.focus(function(){
    		showLabels($(this).parent());
   		})
    	.change(function(){
    		addLabels();
   		});
    
    	// to remove a newly added label
    	var del=document.createElement("input");
    	$(del).attr({"type":"checkbox"})
    	.change(function(){
    		// destroying means emptying every input so it will be ignored
    		removeLabel($(this));
    	});
    	var del_span=document.createElement("span");
    	$(del_span).attr("class", "remove");
    	del_span.appendChild(del);
    	
    	$(li).append(input);
   		$("#added_labels>li:last-child").append(del_span);
    	$("#added_labels").append(li);    
  	}
}
function removeLabel(el){
	li=el.parents("li"); 
	// dont remove empty fields, then new labels can be added
	if ($(li).children(".q_label").val()!=""){
		li.children('input').val('');
    	li.hide();
    }
}
function showLabels(el){
	$("#existing_labels").detach().appendTo(el).show();
	setTimeout(function() {$("#existing_labels").hide();}, 3500);
}

function label_is(nr, text){
	li=$("#existing_labels").parent();
	if ($(li).hasClass("change_label")) {
		li.children("input[type=hidden]").val(nr);	
		li.children("input[type=text]").attr("value",text);
	} else {
		m = $("#added_labels").children('.change_label').length;
				
		hidden=document.createElement("input");
		$(hidden).attr({"name": 'question[labels_questions_attributes]['+m+'][label_id]', "type":"hidden" });
		$(hidden).appendTo(li);
		
		inp=$(li).children("input[type=text]");
		inp.attr({"name": 'unused', "disabled":""} );
		
		$(li).attr("class", "change_label");
		li.children("input[type=hidden]").val(nr);	
		li.children("input[type=text]").attr("value",text);
		addLabels();
	}

	$("#existing_labels").hide();
}