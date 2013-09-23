$(document).ready(function(){
	$('.vote_create').on('ajax:success', function(e, data, status, xhr) {
		console.log(data);
		console.log("success")
		$(this).siblings('.votes').text("Votes: " + data.vote_count);
	});
	$('.vote_create').on('ajax:error', function(e, xhr, status, error) {
		console.log(status);
		console.log("failure");
	});
});