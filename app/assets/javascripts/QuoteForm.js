document.addEventListener("turbolinks:load", function() {
    $(".q-hide").hide();
    $(".q-final").hide();
    $(".radio-hide").hide();
    $("#submit").hide();
    $(".hide-end").hide();
    $("#thanks").hide();

    var $resBuild = $("#buildingResidential");
    var $comBuild = $("#buildingCommercial");
    var $corBuild = $("#buildingCorporate");
    var $hybBuild = $("#buildingHybrid");
    
    var door = $("#numDoor");
    var floor = $("#numFloor");
    var bas = $("#numBasement");
    var parking = $("#numParking");
    var maxPF = $("#numMaxPersonFloor");
    var activeH = $("#numActiveHour");
    var demand = $("#numDemand");
    
    var $rStd = $("#radioStandard");
    var $rPrm = $("#radioPremium");
    var $rExc = $("#radioExcelium");
    
    
    
    // this function has been found here: https://www.w3resource.com/javascript-exercises/javascript-math-exercise-39.php
    function thousands_separators(num)
    {
        var num_parts = num.toString().split(".");
        num_parts[0] = num_parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, "'");
        return num_parts.join(".");
    }
    
    //will show radio
    function showRadio () {
        if($(".radio-hide").is(":hidden")) {
            $(".radio-hide").show();
        }else {
            return
        }
    }
    
    function showFinal() {
        $(".q-final").hide();
        $("#fNumElev").show();
        $("#fPriceElev").show();
        $("#fInstPrice").show();
        $("#fTotalPrice").show();
    }
    
    function resField() {
        $("#fNumElev").text("Number of Elevator sugested: ");
        $("#fPriceElev").text("Price of elevator: ");
        $("#fNumColumn").text("Number of Column needed: ");
        $("#fInstPrice").text("Instalation fee: ");
        $("#fNumElevColumn").text("Number of elevator per Column: ");
        $("#fTotalPrice").text("Total price: ");
    };
    
    /* hide/show the right element */
    $resBuild.click(function() {
        showFinal()
        resField();
        $("#numDoorText").text("Number of appartment");
        togClass($resBuild);
    });
    $comBuild.click(function() {
        showFinal()
    
        resField();
        $("#numDoorText").text("Number of different shop");
        togClass($comBuild);
        $("#q-parking").show();
        $("#q-demand").show();
    });
    $corBuild.click(function() {
        showFinal()
        $("#fNumColumn").show();
        $("#fNumElevColumn").show();
        resField();
        $("#numDoorText").text("Number of different company")
        togClass($corBuild);
        $("#q-parking").show();
        $("#q-maxPerson").show();
    });
    $hybBuild.click(function() {
        showFinal()
        $("#fNumColumn").show();
        $("#fNumElevColumn").show();
        resField();
        $("#numDoorText").text("Number of different shop")
        togClass($hybBuild);
        $("#q-parking").show();
        $("#q-maxPerson").show();
        $("#q-hour").show();
    });
    /* hide/show the right element */
    
    
    
    
    // show/hide selected element & change color button for building type
    function togClass(element) {
        $("#resultBuilding").val(element.val());
        $(".build-type").css("color", "black")
        $(".build-type").removeClass("q-selected");
        $(".build-type").css("background-color", "#FCFCFC");
        element.css("color", "#fff");
        element.css("background-color", "#0066cc")
        element.addClass("q-selected")
        $(".q-hide").hide();
        $("#q-door").show();
        $("#q-floor").show();
        $("#q-basement").show();
        $(".q-press").val("");
        showRadio();
        checkFields()
        $("#submit").show();
        $(".hide-end").show();
    };
    // show/hide selected element & change color button for building type
    
    
    
    
    
    
    
    
    // check wich button selected then execute function
    function updateVal() {
        if($resBuild.hasClass("q-selected") === true) {
            return calcResidential();
        }
    
        else if($comBuild.hasClass("q-selected") === true) {
            return calcCommercial();
    
        }
    
        else if($corBuild.hasClass("q-selected") === true) {
            return calcCorporateHybrid();
        }
    
        else if($hybBuild.hasClass("q-selected") === true) {
            return calcCorporateHybrid();
        }
    };
    // will call the other function for calculating the elevator
    
    
    
    //check the fields for right input
    function checkFields() {
        if($resBuild.hasClass("q-selected") === true) {
            if(!door.val() || !floor.val()) {
            }else {
                updateVal();
                whichPrice();
            }
        }
    
        else if($comBuild.hasClass("q-selected") === true) {
            if(!demand.val()) {
            }else {
                updateVal();
                whichPrice();
            }
        }
    
        else if($corBuild.hasClass("q-selected") === true) {
            if(!floor.val() || !bas.val() || !maxPF.val()) {
            }else {
                updateVal();
                whichPrice();
            }
        }
        
        else if($hybBuild.hasClass("q-selected") === true) {
            if(!floor.val() || !bas.val() || !maxPF.val()) {
            }else {
                updateVal();
                whichPrice();
            }
        }
    };
    
    
    
    
    
    //will calculate number of appartment needed for residential building
    function calcResidential () {
            var $numBasement = bas.val();
            var numAvg = (door.val()/floor.val());
            console.log(numAvg);
            var floorCheck = Math.floor(floor.val()/20);
            floorCheck += 1;
            var remain = Math.ceil(numAvg/6);
            if(remain === 0) {
                remain = 1;
            }
            var numElev = remain * floorCheck;
            
            $("#finalNumElev").val(numElev);
            
            $("#fNumElev").text("Number of Elevator sugested: " + numElev);
            $("#fNumColumn").text("Number of Column needed: ");
            $("#fNumElevColumn").text("Number of elevator per Column: ");
            return numElev;
    };
    //will calculate number of appartment needed for residential building
    
    
    
    
    
    //will calculate number of appartment needed for commercial building
    function calcCommercial () {
        var numElev = demand.val();
        $("#fNumElev").text("Number of Elevator sugested: " + numElev);
        $("#fNumColumn").text("Number of Column needed: ");
        $("#fNumElevColumn").text("Number of elevator per Column: ");
        $("#finalPriceElevator").val(numElev);
        return numElev;
    };
    //will calculate number of appartment needed for commercial building
    
    
    
    
    
    // willcalculate the number of appartement needed for corporate building
    function calcCorporateHybrid () {
        var $ppf = maxPF.val();
        var $totalFloor = (+floor.val() + +bas.val());
    
        var $maxTotalPersons = ($ppf * $totalFloor);
        var Elevators = Math.ceil($maxTotalPersons/1000);
        if(Elevators === 0) {
            Elevators = 1;
        }
    
        var numColumn = Math.ceil($totalFloor/20);
        $("#fNumColumn").text("Number of Column needed: " + numColumn);
    
        var numElevColumn = Math.ceil(Elevators/numColumn)
        $("#fNumElevColumn").text("Number of elevator per Column: " + numElevColumn);
    
        var totalElevator = numElevColumn * numColumn;
        $("#fNumElev").text("Number of Elevator sugested: " + totalElevator);

        $("#finalNumElev").val(totalElevator);
        $("#finalNumberElevatorColumn").val(numElevColumn);
        $("#finalColumn").val(numColumn);

        return totalElevator;
    
    };
    // willcalculate the number of appartement needed for corporate building
    
    
    
    
    // add class to element to check later if its the right element selected
    function priceClass(element) {
        $(".radio-price").removeClass("q-price");
        element.addClass("q-price");
    };
    
    
    
    
    
    
    
    
    
    //will calculate the price with diffrent model of elevator
    function whichPrice() {
        var numElevator = updateVal();
        
        if($rStd.hasClass("q-price") === true){
            var elevatorPrice = numElevator * 7565;
            var realElevatorPrice = parseFloat(elevatorPrice).toFixed(2);
            realElevatorPrice = thousands_separators(realElevatorPrice);
            $("#fPriceElev").text("Price of elevator:  " + realElevatorPrice + "$");
            $("#finalPriceElevator").val(realElevatorPrice);

            var instPrice = (elevatorPrice * 0.10);
            var realInstPrice = parseFloat(instPrice).toFixed(2);
            realInstPrice = thousands_separators(realInstPrice);
            $("#fInstPrice").text("Instalation fee:  " + realInstPrice + "$");
            $("#finalInstalationFee").val(realInstPrice);

            var totalPrice = (instPrice + elevatorPrice); 
            var realTotalPrice = parseFloat(totalPrice).toFixed(2);
            realTotalPrice = thousands_separators(realTotalPrice);
            $("#fTotalPrice").text("Total price:  " + realTotalPrice + "$");
            $("#finalTotalPrice").val(realTotalPrice);
            $("#pricePerElevator").val(7565)
        }
    
        else if($rPrm.hasClass("q-price") === true){
            var elevatorPrice = numElevator * 12345;
            var realElevatorPrice = parseFloat(elevatorPrice).toFixed(2);
            realElevatorPrice = thousands_separators(realElevatorPrice);
            $("#fPriceElev").text("Price of elevator:  " + realElevatorPrice + "$");
            $("#finalPriceElevator").val(realElevatorPrice);
    
            var instPrice = (elevatorPrice * 0.13);
            var realInstPrice = parseFloat(instPrice).toFixed(2);
            realInstPrice = thousands_separators(realInstPrice);
            $("#fInstPrice").text("Instalation fee:  " + realInstPrice + "$");  
            $("#finalInstalationFee").val(realInstPrice);
    
            var totalPrice = (instPrice + elevatorPrice)
            var realTotalPrice = parseFloat(totalPrice).toFixed(2);
            realTotalPrice = thousands_separators(realTotalPrice);
            $("#fTotalPrice").text("Total price:  " + realTotalPrice + "$");
            $("#finalTotalPrice").val(realTotalPrice);
            $("#pricePerElevator").val(12345)
        }
    
        else if($rExc.hasClass("q-price") === true){
            var elevatorPrice = numElevator * 15400;
            var realElevatorPrice = parseFloat(elevatorPrice).toFixed(2);
            realElevatorPrice = thousands_separators(realElevatorPrice);
            $("#fPriceElev").text("Price of elevator:  " + realElevatorPrice + "$");
            $("#finalPriceElevator").val(realElevatorPrice);
    
            var instPrice = (elevatorPrice * 0.16);
            var realInstPrice = parseFloat(instPrice).toFixed(2);
            realInstPrice = thousands_separators(realInstPrice);
            $("#fInstPrice").text("Instalation fee:  " + realInstPrice + "$");
            $("#finalInstalationFee").val(realInstPrice);
    
            var totalPrice = (instPrice + elevatorPrice)
            var realTotalPrice = parseFloat(totalPrice).toFixed(2);
            realTotalPrice = thousands_separators(realTotalPrice);
            $("#fTotalPrice").text("Total price:  " + realTotalPrice + "$");
            $("#finalTotalPrice").val(realTotalPrice);
            $("#pricePerElevator").val(15400)
        }
    }
    
    
    
    $rStd.click(function(){
        priceClass($rStd);
        checkFields()
    });
    
    
    $rPrm.click(function(){
        priceClass($rPrm);
        checkFields()
    });
    
    $rExc.click(function(){
        priceClass($rExc);
        checkFields()
    });
    
   
   
    
    
    $(".q-press").on("input", function(){
        if(activeH.val() > 24) {
            activeH.val("");
            alert("There is only 24 hours in a day.");
        }else if(activeH.val() < 0) {
            activeH.val("");
            alert("Hours can't be negarive.");
        }else if(door.val() < 0) {
            door.val("");
            alert("This number can't be negative.");
        }else if(floor.val() < 0 ) {
            floor.val("");
            alert("This number can't be negative.");
        }else if(bas.val() < 0) {
            bas.val("");
            alert("This number can't be negative.");
        }else if(parking.val() < 0) { 
            parking.val("");
            alert("This number can't be negative.");
        }else if(maxPF.val() < 0) {
            maxPF.val("");
            alert("This number can't be negative.");
        }else if(demand.val() < 0) {
            demand.val("");
            alert("This number can't be negative.");
        }else {
            resField();
            checkFields();
        } 
    });
});