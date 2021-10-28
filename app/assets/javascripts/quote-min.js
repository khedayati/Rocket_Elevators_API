var value;
var radioSelected;
var fee;
var nbApt;
var nbFloor;
var nbElevator;
var nbBase;
var nbOccupants;


// Main Function, Show fields and Hide them
function mainFunction(){

    emptyFields();

    var select = document.getElementById('buildingsType');
    value = select.options[select.selectedIndex].value;
    document.getElementById('step2').style.visibility= 'visible';
    document.getElementById('step3').style.visibility= 'visible';
    document.getElementById('step4').style.visibility= 'visible';
    document.getElementById('input-fields-2').style.visibility= 'visible';
    document.getElementById("selectedBuilding").innerHTML = value;
    document.getElementById('input-fields').style.visibility= 'visible';

    // Residential Fields
    if(value=="residential"){
        $('#number-of-apartments').show();
        $('#number-of-floors').show();
        $('#number-of-basement').show();
        $('#number-of-companies').hide();
        $('#number-of-parking-spots').hide();
        $('#number-of-elevators').hide();
        $('#number-of-corporations').hide();
        $('#maximum-occupancy').hide();
        $('#business-hours').hide();
    // Commercial Fields
    }else if(value=="commercial"){
        $('#number-of-apartments').hide();
        $('#number-of-floors').show();
        $('#number-of-basement').show();
        $('#number-of-companies').show();
        $('#number-of-parking-spots').show();
        $('#number-of-elevators').show();
        $('#number-of-corporations').hide();
        $('#maximum-occupancy').hide();
        $('#business-hours').hide();
    // Corporate Fields    
    }else if(value=="corporate"){
        $('#number-of-apartments').hide();
        $('#number-of-floors').show();
        $('#number-of-basement').show();
        $('#number-of-companies').hide();
        $('#number-of-parking-spots').show();
        $('#number-of-elevators').hide();
        $('#number-of-corporations').show();
        $('#maximum-occupancy').show();
        $('#business-hours').hide();
    // Hybride Fields
    }else if(value=="hybride"){
        $('#number-of-apartments').hide();
        $('#number-of-floors').show();
        $('#number-of-basement').show();
        $('#number-of-companies').show();
        $('#number-of-parking-spots').show();
        $('#number-of-elevators').hide();
        $('#number-of-corporations').hide();
        $('#maximum-occupancy').show();
        $('#business-hours').show();

    }else if(value=="select"){
        document.getElementById('step2').style.visibility= 'hidden';
        document.getElementById('step3').style.visibility= 'hidden';
        document.getElementById('input-fields-2').style.visibility= 'hidden';
        document.getElementById('input-fields').style.visibility= 'hidden';
        
    document.getElementById('step4').style.visibility= 'visible';
        $('#number-of-apartments').hide();
        $('#number-of-floors').hide();
        $('#number-of-basement').hide();
        $('#number-of-companies').hide();
        $('#number-of-parking-spots').hide();
        $('#number-of-elevators').hide();
        $('#number-of-corporations').hide();
        $('#maximum-occupancy').hide();
        $('#business-hours').hide();
    }   
    




}

// Clear Fields on everychange
function emptyFields(){
    document.getElementById('txtApt').value = '';
    document.getElementById('txtFloor').value = '';
    document.getElementById('txtBasement').value = '';
    document.getElementById('txtCompanies').value = '';
    document.getElementById('txtParking').value = '';
    document.getElementById('txtElevators').value = '';
    document.getElementById('txtCorporation').value = '';
    document.getElementById('txtOccupancy').value = '';
    document.getElementById('txtHours').value = '';
    $('#txtAmntElevator').attr('placeholder','');
    $('#txtElevatorTotalPrice').attr('placeholder','');
    $('#txtInstallationFee').attr('placeholder','');
    $('#txtTotal').attr('placeholder','');
    $('#txtPriceElevator').attr('placeholder','');
  
}


// CHange of raido Button Action
function radioAction(){
    if(document.getElementById('standard').checked) {
        radioSelected = 7565;
        fee = 1.1;
        $('#txtPriceElevator').attr('placeholder',"7,565.00 $");
        
    
      }else if(document.getElementById('premium').checked) {
         radioSelected=12345;
         fee = 1.13;
        $('#txtPriceElevator').attr('placeholder',"12,345.00 $");
    
      }else if(document.getElementById('excelium').checked) {
        fee = 1.16;
        radioSelected= 15400;
        $('#txtPriceElevator').attr('placeholder',"15,400.00 $");
    
      }
}

//Verify that All required Fields are filled and it's valid integer
function verifyInput(bldngType){

    
    if(bldngType==0){
        
             if(document.getElementById('txtApt').value==''
             || document.getElementById('txtFloor').value==''
             || document.getElementById('txtBasement').value==''){
                $('#txtAmntElevator').attr('placeholder','Loading...');
                $('#txtElevatorTotalPrice').attr('placeholder','Loading...');
                $('#txtInstallationFee').attr('placeholder','Loading...');
                $('#txtTotal').attr('placeholder','Loading...');
                return false;
             }else{
                 return true;
             }

    }else if(bldngType==1){
        if(document.getElementById('txtFloor').value==''
             || document.getElementById('txtBasement').value==''
             || document.getElementById('txtParking').value==''
             || document.getElementById('txtCompanies').value==''
             || document.getElementById('txtElevators').value==''){
                $('#txtAmntElevator').attr('placeholder','Loading...');
                $('#txtElevatorTotalPrice').attr('placeholder','Loading...');
                $('#txtInstallationFee').attr('placeholder','Loading...');
                $('#txtTotal').attr('placeholder','Loading...');
                return false;
             }else{
                 return true;
             }

    }else if(bldngType==2){
        if(document.getElementById('txtFloor').value==''
             || document.getElementById('txtBasement').value==''
             || document.getElementById('txtParking').value==''
             || document.getElementById('txtCorporation').value==''
             || document.getElementById('txtOccupancy').value==''){
                $('#txtAmntElevator').attr('placeholder','Loading...');
                $('#txtElevatorTotalPrice').attr('placeholder','Loading...');
                $('#txtInstallationFee').attr('placeholder','Loading...');
                $('#txtTotal').attr('placeholder','Loading...');
                return false;
             }else{
                 return true;
             }

    }else if(bldngType==3){
        if(document.getElementById('txtFloor').value==''
             || document.getElementById('txtBasement').value==''
             || document.getElementById('txtParking').value==''
             || document.getElementById('txtCompanies').value==''
             || document.getElementById('txtOccupancy').value==''
             || document.getElementById('txtHours').value==''){
                $('#txtAmntElevator').attr('placeholder','Loading...');
                $('#txtElevatorTotalPrice').attr('placeholder','Loading...');
                $('#txtInstallationFee').attr('placeholder','Loading...');
                $('#txtTotal').attr('placeholder','Loading...');
                return false;
             }else{
                 if(parseInt(document.getElementById('txtHours').value)>24){
                        alert("Error Must be under 24h");
                         document.getElementById('txtHours').value = '';
                 }else{
                    return true;
                 }
                 
             }

    }
    
}

// Action on the Fields change
function actionListener(){
    
    radioAction();
// Residential Calculation
    if(value=="residential"){
       if(verifyInput(0)==true){
        nbApt = parseInt(document.getElementById('txtApt').value);
        nbFloor = parseInt(document.getElementById('txtFloor').value);
        nbElevator = Math.ceil((nbApt/nbFloor)/6);
        var nbColumn= Math.ceil(nbFloor/20);
        nbElevator=nbElevator*nbColumn;
        finalCalcul();
       } 
        

        
 // Commercial Calculation       

      }else if(value=="commercial"){
        if(verifyInput(1)==true){
            nbElevator = parseInt(document.getElementById('txtElevators').value);
            finalCalcul();
        }
        

// Corporate and Hybrid Calculation
    }else if(value=="corporate" || value== "hybride"){
        let verify;
        if(value=="corporate"){
            
            verify = verifyInput(2);

        }else{
            verify = verifyInput(3);
        }
        if(verify == true)
        {
            nbFloor= parseInt(document.getElementById('txtFloor').value);
            nbBase = parseInt(document.getElementById('txtBasement').value);
            nbOccupants= parseInt(document.getElementById('txtOccupancy').value) ;
            var nbELevel=Math.ceil(((nbFloor + nbBase) * nbOccupants)/1000);
            var nbColumnLVL=Math.ceil((nbFloor + nbBase)/20);
            var nbElvColum=Math.ceil(nbELevel/nbColumnLVL);
            nbElevator = Math.ceil(nbElvColum*nbElvColum);
            finalCalcul();
        }    
        
        
       }




}
//  Do the Final Calculation and print output
function finalCalcul(){
    
    var elevatorPrice = Math.ceil(nbElevator * radioSelected);   
    $('#txtAmntElevator').attr('placeholder',nbElevator);
    $('#txtElevatorTotalPrice').attr('placeholder',elevatorPrice.toLocaleString("en",{useGrouping: true,minimumFractionDigits: 2})+ " $");
    $('#txtInstallationFee').attr('placeholder',(elevatorPrice*(fee-1)).toLocaleString("en",{useGrouping: true,minimumFractionDigits: 2})+ " $");
    $('#txtTotal').attr('placeholder',(elevatorPrice*fee).toLocaleString("en",{useGrouping: true,minimumFractionDigits: 2})+ " $");
  
}