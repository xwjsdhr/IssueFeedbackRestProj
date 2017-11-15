function notification(msg,type){
	$.notify(
			{
				message: "<strong>"+ msg +"</strong>"
			}, 
			{ 
				element:"body",
				allow_dismiss: false,
				type:type,
				delay:100,
				timer: 100,
				animate: {
					enter: 'animated fadeInDown',
					exit: 'animated fadeOutUp'
				},
			}
		);
}