$(document).ready(function(){
	$('.vote_create').on('ajax:success', function(e, data, status, xhr) {
		e.preventDefault();
		console.log(data);
		console.log("success")
		$(this).siblings('.votes').text("Votes: " + data.vote_count);
	}).on('ajax:error', function(e, xhr, status, error) {
		e.preventDefault();
		console.log(status);
		console.log("failure");
	});
});