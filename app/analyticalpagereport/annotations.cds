using CatalogService as service from '../../srv/cat-service';


// Annotate the Orderitems entity with UI annotations
annotate service.Orderitems with @(
    // 1. Chart annotation
    UI.Chart #sumQtyChart           : {
        $Type    : 'UI.ChartDefinitionType',
        ChartType: #Bar,
        // Dimensions: [book_ID], // Uncomment if you want to group by book
        Measures : [quantity]
    },

    // 2. PresentationVariant annotation
    UI.PresentationVariant #sumQtyPV: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: [
                         // '@UI.LineItem', // Uncomment if you want to show table view
                        '@UI.Chart#sumQtyChart'],
        Text          : 'Qty Sum'
    },

    // 3. DataPoint annotation
    UI.DataPoint #sumQtyDP          : {
        $Type: 'UI.DataPointType',
        Value: quantity
    },

    // 4. KPI annotation
    UI.KPI #KPIQuantity             : {
        ID              : 'KPIQuantity',
        $Type           : 'UI.KPIType',
        SelectionVariant: {
            Text         : 'test',
            $Type        : 'UI.SelectionVariantType',
            SelectOptions: [{
                PropertyName: quant
                Ranges      : [{
                    Sign  : #I,
                    Option: #GT,
                    Low   : '0'
                }]
            }]
        },
        DataPoint       : ![@UI.DataPoint#sumQtyDP],
        Detail          : {DefaultPresentationVariant: ![@UI.PresentationVariant#sumQtyPV]}
    }
);
