$(document).ready(function()
{
    $("#alertSuccess").hide();
    $("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
// If valid------------------------
	
	
	var type = ($("#hidUserID_tblSave").val() == "") ? "POST" : "PUT";
	

	$.ajax({
		url : "UserAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidUserID_tblSave").val("");
	$("#formItem")[0].reset();
}

// UPDATE==========================================
$(document).on("click",".btnUpdate",function(event) {
			$("#hidUserID_tblSave").val($(this).closest("tr").find('#hidUserID_tblIDlUpdate').val());
			$("#User_ID").val($(this).closest("tr").find('td:eq(0)').text());
			$("#User_Name").val($(this).closest("tr").find('td:eq(1)').text());
			$("#User_DOB").val($(this).closest("tr").find('td:eq(2)').text());
			$("#User_Email").val($(this).closest("tr").find('td:eq(3)').text());
			$("#User_Gender").val($(this).closest("tr").find('td:eq(4)').text());
			$("#User_Phone_No").val($(this).closest("tr").find('td:eq(5)').text());
			$("#User_Address").val($(this).closest("tr").find('td:eq(6)').text());
		});
		


//remove
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "UserAPI",
		type : "DELETE",
		data : "UserID_tbl=" + $(this).data("userid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});


function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}
// CLIENTMODEL=========================================================================
function validateItemForm() {
	// CODE
	if ($("#User_ID").val().trim() == "") {
		return "Insert User Code.";
	}
	// NAME
	if ($("#User_Name").val().trim() == "") {
		return "Insert User Name.";
	}
	// PRICE-------------------------------
	if ($("#User_DOB").val().trim() == "") {
		return "Insert User DOB";
	}
	// is numerical value
	if ($("#User_Email").val().trim() == "") {
		return "Insert a valid email for User Email.";
	}
	// DESCRIPTION------------------------
	if ($("#User_Gender").val().trim() == "") {
		return "Insert User Gender.";
	}
	if ($("#User_Phone_No").val().trim() == "") {
		return "Insert  value for PhoneNo.";
	}
	// DESCRIPTION------------------------
	if ($("#User_Address").val().trim() == "") {
		return "Insert User Address.";
	}
	return true;
}