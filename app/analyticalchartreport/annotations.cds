using CatalogService as service from '../../srv/cat-service';

annotate service.Orderitems with @(
    UI.FieldGroup #General                     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'quantity',
                Value: quantity,
            },
            {
                $Type: 'UI.DataField',
                Label: 'amount',
                Value: amount,
            },
            {
                $Type: 'UI.DataField',
                Value: currency_code,
            },
        ],
    },
    UI.Facets                                  : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'General',
        ID    : 'General',
        Target: '@UI.FieldGroup#General',
    }, ],
    UI.LineItem                                : [
        {
            $Type: 'UI.DataField',
            Label: 'quantity',
            Value: quantity,
        },
        {
            $Type: 'UI.DataField',
            Label: 'amount',
            Value: amount,
        },
    ],
    UI.SelectionFields                         : [book_ID],
    Aggregation                                : {
        ApplySupported           : {
            $Type                 : 'Aggregation.ApplySupportedType',
            GroupableProperties   : [
                ID,
                book_ID,
                currency_code
            ],
            AggregatableProperties: [
                {Property: quantity},
                {Property: amount}
            ]
        },
        CustomAggregate #amount  : 'Edm.Decimal',
        CustomAggregate #quantity: 'Edm.Int'
    },
    UI.Chart #chartView2                       : {
        $Type     : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Dimensions: [ID, ],
        Measures  : [
            quantity,
            amount
        ],
    },
    UI.SelectionPresentationVariant #tableView : {
        $Type              : 'UI.SelectionPresentationVariantType',
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            SelectOptions: []
        },
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            Visualizations: ['@UI.LineItem'],
            SortOrder     : []
        },
        Text               : 'Table View'
    },

    UI.SelectionPresentationVariant #chartView2: {
        $Type              : 'UI.SelectionPresentationVariantType',
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            SelectOptions: []
        },
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            Visualizations: ['@UI.Chart#chartView2'],
            SortOrder     : []
        },
        Text               : 'Chart View'
    }
);

annotate service.Orderitems with {
    amount    @Analytics.Measure  @Aggregation.default: #SUM  @Measures.ISOCurrency: currency_code;
    quantity  @Analytics.Measure  @Aggregation.default: #SUM;
    book      @Common.Text: book.title
};

annotate service.Orderitems with {
    parent @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Orders',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: parent_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'OrderNo',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'buyer',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'total',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'currency_code',
            },
        ],
    }
};

annotate service.Orderitems with {
    book @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Books',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: book_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'title',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'descr',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'genre_ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'stock',
            },
        ],
    }
};
