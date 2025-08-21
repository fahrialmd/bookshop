sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'analyticalpagereport/test/integration/FirstJourney',
		'analyticalpagereport/test/integration/pages/OrderitemsList',
		'analyticalpagereport/test/integration/pages/OrderitemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderitemsList, OrderitemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('analyticalpagereport') + '/index.html'
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