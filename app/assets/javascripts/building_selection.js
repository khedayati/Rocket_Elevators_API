$('#Customer').on('change', function() {
    console.log("customer changed")
        value = $('#Customer').val()
        $.ajax({
            url: "/update_building/" + value,
            method: "GET",  
            dataType: "json",
            
            
            
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log('response',response);
                // var tasks = response["tasks"];
                $("#building_id").empty();
                var buildings = response['buildings']
                
                $('#building_id').find('option').not(':first').remove();
                // $("#Building").find('<option>Select Task</option>');
                for(var i = 0; i < buildings.length; i++){
                    $("#building_id").append(('<option value="' + buildings[i].id + '">' + buildings[i].full_name_of_the_building_administrator) + '</option>');

                }
                return false
            }
        });
})
$('#building_id').on('change', function() {
    console.log("building changed")
        value = $('#building_id').val()
        $.ajax({
            url: "/update_battery/" + value,
            method: "GET",  
            dataType: "json",
            
            
            
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log('response',response);
                $("#battery_id").empty();
                var batteries = response['batteries']
                
                $('#battery_id').find('option').not(':first').remove();
                for(var i = 0; i < batteries.length; i++){
                    $("#battery_id").append(('<option value="' + batteries[i].id + '">' + batteries[i].id) + '</option>');

                }
                return false
            }
        });

    
});

$('#battery_id').on('change', function() {
    console.log("battery changed")
        value = $('#battery_id').val()
        $.ajax({
            url: "/update_column/" + value,
            method: "GET",  
            dataType: "json",
            
            
            
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log('response',response);
                $("#column_id").empty();
                var columns = response['columns']
                
                $('#column_id').find('option').not(':first').remove();
                for(var i = 0; i < columns.length; i++){
                    $("#column_id").append(('<option value="' + columns[i].id + '">' + columns[i].id) + '</option>');

                }
                return false
            }
        });
});

$('#column_id').on('change', function() {
    console.log("column changed")
        value = $('#column_id').val()
        $.ajax({
            url: "/update_elevator/" + value,
            method: "GET",  
            dataType: "json",
            
            
            
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log('response',response);
                $("#elevator_id").empty();
                var elevator = response['elevators'];
                console.log(response)
            
            
                $('#elevator_id').find('option').not(':first').remove();
                for(var i = 0; i < elevator.length; i++){
                    $("#elevator_id").append(('<option value="' + elevator[i].id + '">' + elevator[i].id) + '</option>');

                }
            
            }
        });
});

