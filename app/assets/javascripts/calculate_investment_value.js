$(function() { 
	$('#invest_amount').keypress(function(event) {
  		if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
    		event.preventDefault();
  		}
	});

	$('#calculate_income').on('click', function() {
		let amount = parseFloat($("#invest_amount").val());
		let year = $("#invest_selected_date_1i").val();
		let month = $("#invest_selected_date_2i").val();
		let day = $("#invest_selected_date_3i").val();
		let combine_date = year + "-" + month + "-" + day;

		if(isNaN(amount)) {
			alertMessage("Please check Amount.")
		}
		else
		{
			let data = {
				amount 			: amount,
				combine_date 	: combine_date
			}
			$.ajax({
				type: "POST",
				url: "/invests/calculate_investment_value",
				async: false,
				data: {  invest_data: data },
				success: function(response) {
					alert(response.data);
				},
				error: function(xhr, status, error){
					alertMessage("Please try again.");
				}
			});	
		}
	});

	function alertMessage(message){
		$("#alert-msg").html('<div class="alert alert-danger"><button type="button" class="close"></button>"'+ message +'"</div>');
		$(".alert").fadeTo(3000, 0).slideUp(3000, function(){
	  		$(this).remove();
	  	});
	  	$('.alert .close').on("click", function(e){
	  		$(this).parent().fadeTo(3000, 0).slideUp(3000);
	  	});
	}
});
