var elevatorAmountCalculated = false
var valueOfRadio
var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
  });
var totalShafts
function isEmpty(str) {
    return !str.trim().length;
}
var selection
function selectChanged(){
    elevatorAmountCalculated = false
    var inputClasses = document.getElementsByClassName('input')
    inputClasses.hidden = true
    document.getElementsByName("elevator-amount")[0].value = 0
    selection = document.getElementById('building-type').value
    for(var i = 0 ; i < inputClasses.length; i++){
        inputClasses[i].setAttribute("hidden", "true")
    }
    if(selection == "residential"){
        document.getElementById('number-of-floors').removeAttribute('hidden')
        document.getElementById('number-of-apartments').removeAttribute("hidden")
        document.getElementById('number-of-basements')  .removeAttribute("hidden")
        
    }
    else if (selection == "commercial"){
        document.getElementById('number-of-floors').removeAttribute('hidden')
        document.getElementById('number-of-basements').removeAttribute('hidden')
        document.getElementById('number-of-companies').removeAttribute('hidden')
        document.getElementById('number-of-parking-spots').removeAttribute('hidden')
        document.getElementById('number-of-elevators').removeAttribute('hidden')
    }
    else if (selection == "corporate"){
        document.getElementById('number-of-floors').removeAttribute('hidden')
        document.getElementById('number-of-basements').removeAttribute('hidden')
        document.getElementById('number-of-parking-spots').removeAttribute('hidden')
        document.getElementById('number-of-corporations').removeAttribute('hidden')
        document.getElementById('maximum-occupancy').removeAttribute('hidden')
    }
    else if (selection == "hybrid"){
        document.getElementById('number-of-floors').removeAttribute('hidden')
        document.getElementById('number-of-basements').removeAttribute('hidden')
        document.getElementById('number-of-companies').removeAttribute('hidden')
        document.getElementById('number-of-parking-spots').removeAttribute('hidden')
        document.getElementById('maximum-occupancy').removeAttribute('hidden')
        document.getElementById('business-hours').removeAttribute('hidden')
    }
}
function calculateElevators(radio){
    document.getElementById("price-calculation").setAttribute("hidden", "true")
    elevatorAmountCalculated = false
    selection = document.getElementById('building-type').value
    if(selection == "commercial" && document.getElementsByName("number-of-elevators")[0].value > 0){
        totalShafts = document.getElementsByName("number-of-elevators")[0].value
        document.getElementsByName("elevator-amount")[0].value = document.getElementsByName("number-of-elevators")[0].value
        elevatorAmountCalculated = true
    }
    else if(selection == "residential" && document.getElementsByName("number-of-apartments")[0].value > 0 && document.getElementsByName("number-of-floors")[0].value > 0){
        var numberOfColumns = Math.ceil(parseInt(document.getElementsByName("number-of-floors")[0].value) / 20)
        console.log("number of columns " + numberOfColumns )
        var averageDoorsPerFloors = (parseInt(document.getElementsByName("number-of-apartments")[0].value) / parseInt(document.getElementsByName("number-of-floors")[0].value))
        console.log("average doors per floor " + averageDoorsPerFloors )
        var numberOfShaftsPerColumn = Math.ceil(averageDoorsPerFloors / 6)
        console.log("shafts per column  " + numberOfShaftsPerColumn )
        totalShafts = numberOfShaftsPerColumn * numberOfColumns
        console.log("total shaftS" + totalShafts)
        document.getElementsByName("elevator-amount")[0].value = totalShafts
        elevatorAmountCalculated = true
    }
    else if (selection == "corporate" || selection == "hybrid"){
        if(document.getElementsByName("number-of-floors")[0].value > 0 && document.getElementsByName("number-of-basements")[0].value > 0 && document.getElementsByName("maximum-occupancy")[0].value >0 ) {
            var totalOccupants = (parseInt(document.getElementsByName("number-of-floors")[0].value) + parseInt(document.getElementsByName("number-of-basements")[0].value )) * document.getElementsByName("maximum-occupancy")[0].value // 32* 51 = 1632
            console.log("occupancy total " + totalOccupants )
            var totalElevators = totalOccupants / 1000 // 1632/1000 = 2
            console.log("Total elevators " + totalElevators)
            var numberOfColumn = Math.ceil((parseInt(document.getElementsByName("number-of-floors")[0].value) + parseInt(document.getElementsByName("number-of-basements")[0].value)) / 20) //2
            console.log("number of columns" + numberOfColumn)
            var elevatorsPerColumn = Math.ceil(totalElevators/numberOfColumn)//1
            console.log("elevator per column" + elevatorsPerColumn)
            totalShafts = elevatorsPerColumn * numberOfColumn
            console.log("total Shaft" + totalShafts)
            document.getElementsByName("elevator-amount")[0].value = totalShafts
            elevatorAmountCalculated = true
        }
    }
    if(elevatorAmountCalculated == true && document.getElementsByName("elevator-amount")[0].value != 0){
        document.getElementById("price-calculation").removeAttribute("hidden")
        if(valueOfRadio != undefined){
            calculatePrices()
        }
    }
    
    
}
function radioButtonClicked(radio){
    if(radio.value == "standard"){
        valueOfRadio = "standard"
        document.getElementsByName("elevator-unit-price")[0].value = formatter.format("7565")
    }
    else if(radio.value == "premium"){
        valueOfRadio = "premium"
        document.getElementsByName("elevator-unit-price")[0].value = formatter.format("12345")
    }
    else{
        valueOfRadio = "excelium"
        document.getElementsByName("elevator-unit-price")[0].value = formatter.format("15400")
    }
    console.log(elevatorAmountCalculated)
    if(elevatorAmountCalculated == true && document.getElementsByName("elevator-amount")[0].value != 0){
        calculatePrices()
    }
}
function calculatePrices(){
    if(valueOfRadio == "standard"){
        var totalElevatorPrice = totalShafts * 7565
        document.getElementsByName("elevator-total-price")[0].value = formatter.format(totalElevatorPrice)
        var installationFees = totalElevatorPrice /100 * 10
        document.getElementsByName("installation-fees")[0].value = formatter.format(installationFees)
        var finalPrice = totalElevatorPrice + installationFees
        document.getElementsByName("final-price")[0].value = formatter.format(finalPrice)
    }
    else if(valueOfRadio == "premium"){
        var totalElevatorPrice = totalShafts * 12345
        document.getElementsByName("elevator-total-price")[0].value = formatter.format(totalElevatorPrice)
        var installationFees = totalElevatorPrice / 100 * 13
        document.getElementsByName("installation-fees")[0].value = formatter.format(installationFees)
        var finalPrice = totalElevatorPrice + installationFees
        document.getElementsByName("final-price")[0].value = formatter.format(finalPrice)
    }
    else{
        var totalElevatorPrice = totalShafts * 15400
        document.getElementsByName("elevator-total-price")[0].value = formatter.format(totalElevatorPrice)
        var installationFees = totalElevatorPrice / 100 * 16
        document.getElementsByName("installation-fees")[0].value = formatter.format(installationFees)
        var finalPrice = totalElevatorPrice + installationFees
        document.getElementsByName("final-price")[0].value = formatter.format(finalPrice)
    }
}
