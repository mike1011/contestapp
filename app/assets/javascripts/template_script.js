/* ------------------------- GLOBAL PROPERTIES ------------------------- */
var _body;
var _html;
var _window = $(window);
var _document = $(document);

var _windowWidth = _window.width();
var _windowHeight = _window.height();

_document.ready(documentReadyHandler);

function documentReadyHandler(){
	var _dragContainer = $("#sortable2");
	var _mainContainer = $("#sortable1");
	_mainContainer.css({'width':_windowWidth/2,'height':_windowHeight});
	
	_dragContainer.sortable({connectWith: "#sortable1",cursor: "move",helper:function(e,li){
			this.copyHelper = li.clone().insertAfter(li);
        	$(this).data('copied', false);
        	return li.clone();  
		}
   	})
	_mainContainer.sortable({		
		 receive: function (e, ui) {			 
			 $(".btns").remove();
			$(this).find('li').prepend('<div class="btns"><a href="#" class="editBtn btn-sm btn-primary"><i class="fa fa-edit fa-lg"></i></a> | <a href="#" class="btnClose btn-sm btn-danger"><i class="fa fa-times fa-lg"></i></a></div>');
			
			/*-------Close Btn---------*/
			var _btnClose = $(".btnClose");
			_btnClose.click(function(){
				$(this).parent().parent().remove();	
			});
			
			/*-------Edit Btn---------*/
			var _editBtn = $(".editBtn");
			_editBtn.click(function(){				
				var _contRef = $(this).parent().parent().find('.container').html();				
				var _lightBoxContainer = '<div class="containEditable" contenteditable="true">'+_contRef+'<div class="updateBtn btn-sm btn-info">Update</div></div>';
				$('body').append(_lightBoxContainer);	
				
				var _updateCont = $(".updateBtn");
				_updateCont.on('click',function(){
					var _editContain = $(".containEditable").text();
					$(ui.item.context).find('.container').html(_editContain);
					$(".containEditable").remove()										
				})			
			});
			
			
		}
	})
}