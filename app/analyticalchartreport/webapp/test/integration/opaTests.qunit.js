sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'analyticalchartreport/test/integration/FirstJourney',
		'analyticalchartreport/test/integration/pages/OrderitemsList',
		'analyticalchartreport/test/integration/pages/OrderitemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderitemsList, OrderitemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('analyticalchartreport') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderitemsList: OrderitemsList,
					onTheOrderitemsObjectPage: OrderitemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);