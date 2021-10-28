
    /**Building Type Variables */
    let BType = document.getElementById("building-type");
    let Qone = document.getElementById("number-of-apartments");
    let Qtwo = document.getElementById("number-of-floors");
    let Qthree = document.getElementById("number-of-basements");
    let Qfour = document.getElementById("number-of-companies");
    let Qfive = document.getElementById("number-of-elevators");
    let Qsix = document.getElementById("number-of-corporations");
    let Qseven = document.getElementById("number-of-parking-spots");
    let Qeight = document.getElementById("maximum-occupancy");
    let Qnine = document.getElementById("business-hours");

    /**Radio button Variables */
    var stnd = document.getElementById("inpStandard");
    var prem = document.getElementById("inpPremium");
    var exel = document.getElementById("inpExelium");

    /**Stepper Variables */
    var numApt = document.getElementById("inpNumApt");
    var numFloors = document.getElementById("inpNumFloors");
    var numBase = document.getElementById("inpNumBase");
    var numComp = document.getElementById("inpNumComp");
    var cge = document.getElementById("inpCageAmnt");
    var numCorp = document.getElementById("inpNumCorp");
    var numParking = document.getElementById("inpNumParking");
    var maxOccu = document.getElementById("inpMaxOccu");
    var bussHours = document.getElementById("inpBussHours");

    /**Price Fields*/
    var elvAmnt = document.getElementById("finalElvAmnt");
    var elvPrice = document.getElementById("elvPrice");
    var elvTotalPrice = document.getElementById("elvTPrice");
    var elvinstallFee = document.getElementById("installFee");
    var elvfinalPrice = document.getElementById("finalPrice");

    /**Variables for calculations */
    var fee = 0;
    var standardFee = .1;
    var premiumFee = .13;
    var exeliumFee = .16;

    //residential
    const floorPerColumn = 20;
    const aptsPerShaft = 6;
    let amntShaft = 0;
    let avgDPF = 0;
    let column = 0;

    //commercial / hybrid
    var totalNumOccu = maxOccu.value * numFloors.value;
    var elvsNeeded = totalNumOccu / 1000;
    var columnsNeeded = numFloors.value + numBase.value;
    var finalColumnsNeeded = columnsNeeded / 20;
    var elvsPerColumn = elvsNeeded / finalColumnsNeeded;
    var totalElvsNeeded = elvsPerColumn * finalColumnsNeeded;

    //currency formatter
    var formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
    });

    function showHideOptions() {

        if(BType.value == 1) {
            Qone.style.display = 'block';
            Qtwo.style.display = 'block';
            Qthree.style.display = 'block';
            Qfour.style.display = 'none';
            Qfive.style.display = 'none';
            Qsix.style.display = 'none';
            Qseven.style.display = 'none';
            Qeight.style.display = 'none';
            Qnine.style.display = 'none';
        }

        else if (BType.value == 2) {
            Qfour.style.display = 'block';
            Qtwo.style.display = 'block';
            Qthree.style.display = 'block';
            Qseven.style.display = 'block';
            Qfive.style.display = 'block';
            Qone.style.display = 'none';
            Qsix.style.display = 'none';
            Qeight.style.display = 'none';
            Qnine.style.display = 'none';
        }

        else if (BType.value == 3) {
            Qsix.style.display = 'block';
            Qtwo.style.display = 'block';
            Qthree.style.display = 'block';
            Qseven.style.display = 'block';
            Qeight.style.display = 'block';
            Qone.style.display = 'none';
            Qfour.style.display = 'none';
            Qfive.style.display = 'none';
            Qnine.style.display = 'none';
        }

        else if (BType.value == 4) {
            Qtwo.style.display = 'block';
            Qfour.style.display = 'block';
            Qthree.style.display = 'block';
            Qseven.style.display = 'block';
            Qnine.style.display = 'block';
            Qeight.style.display = 'block';
            Qone.style.display = 'none';
            Qfive.style.display = 'none';
            Qsix.style.display = 'none';
        }

        else if (BType.value == "select-building") {
            Qtwo.style.display = 'none';
            Qfour.style.display = 'none';
            Qthree.style.display = 'none';
            Qseven.style.display = 'none';
            Qnine.style.display = 'none';
            Qeight.style.display = 'none';
            Qone.style.display = 'none';
            Qfive.style.display = 'none';
            Qsix.style.display = 'none';
        }
    }


    /**Plan Selector */
	function planSelect() {

        if (stnd.checked == true) {
            elvPrice.value = "7565";
            console.log("Standard")
        }
        else if (prem.checked == true) {
            elvPrice.value = "12345";
            console.log("Premium")
        }
        else if (exel.checked == true) {
            elvPrice.value = "15400";
            console.log("Excelium")
        }
		
        totalPrice()
        installationFee()
        finalPrice ()
        cagesNeeded()

       formatAll ()
	}
    
    /**Elevators needed */
    function cagesNeeded() {

        //residential
        avgDPF = numApt.value / numFloors.value; 
        var resElvs = Math.ceil(Math.ceil(avgDPF) / 6);
        var Shafts = Math.ceil(parseInt(numFloors.value) / 20); 
        var resFinal = resElvs * Shafts;

        //corporate/hybrid
        totalNumOccu = Number(maxOccu.value) * Number(numFloors.value);
        elvsNeeded = totalNumOccu / 1000;
        columnsNeeded = Number(numFloors.value) + Number(numBase.value);
        console.log("columns needed:", columnsNeeded, "floors",numFloors.value, "Basements", numBase.value)
        finalColumnsNeeded = Math.round(columnsNeeded / 20);
        console.log("final columns num:", finalColumnsNeeded)
        elvsPerColumn = Math.ceil(elvsNeeded / finalColumnsNeeded);
        console.log("elvs / columns", elvsPerColumn)
        totalElvsNeeded = elvsPerColumn * finalColumnsNeeded;

        //Amount of Elevators needed
        //residential
        if (BType.value == 1) {
            elvAmnt.value = resFinal;
            
            console.log("res elvAmnt:", elvAmnt.value);
        } 
        //commercial
        else if (BType.value == 2) {
            elvAmnt.value = cge.value;
        }

        //corporate / hybrid
        else if (BType.value == 3 || 4) {
            elvAmnt.value = Math.round(totalElvsNeeded);
        }

    } 

    function totalPrice() {
        elvAmnt;
        elvPrice;

        elvTotalPrice.value = (elvAmnt.value * elvPrice.value);

        console.log("total price:", elvTotalPrice.value);
    }

    function installationFee() {
        fee;
        standardFee;
        premiumFee;
        exeliumFee

        //residential
        if (stnd.checked == true) {
            fee = (standardFee * Number(elvTotalPrice.value));
            console.log ("fee vairables:", fee);
        }
        //commercial
        else if (prem.checked == true) {
            fee = (premiumFee * Number(elvTotalPrice.value));
        } 
        //corporate / hybrid
        else if (exel.checked == true) {
            fee = (exeliumFee * Number(elvTotalPrice.value));
        }
        elvinstallFee.value = fee;
        console.log("fee's are:" , fee);
    }

    function finalPrice () {
        elvfinalPrice.value = Number(elvTotalPrice.value) + Number(elvinstallFee.value);
        console.log(elvTotalPrice.value, elvinstallFee.value)
    }

    function formatAll () {
        formatter;
        elvTotalPrice;
        elvPrice;
        elvinstallFee;
        elvfinalPrice;

        elvTotalPrice.value = formatter.format(elvTotalPrice.value);
        elvPrice.value = formatter.format(elvPrice.value);
        elvinstallFee.value = formatter.format(elvinstallFee.value);
        elvfinalPrice.value = formatter.format(elvfinalPrice.value);
    }

    function clearFields() {
        elvAmnt.value = "0"
        elvTotalPrice.value = "$0"
        elvPrice.value = "$0"
        elvinstallFee.value = "$0"
        elvfinalPrice.value = "$0"
        numApt.value = "0"
        numFloors.value = "0"
        numBase.value = "0"
        numComp.value = "0"
        cge.value = "0"
        numCorp.value = "0"
        numParking.value = "0"
        maxOccu.value= "0"
        bussHours.value = "0"
        stnd.checked = false;
        prem.checked = false;
        exel.checked = false;
    }
    
