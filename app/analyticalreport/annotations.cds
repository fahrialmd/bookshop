using CatalogService as service from '../../srv/cat-service';

annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OrderNo,
                Label: '{i18n>OrderNumber}',
            },
            {
                $Type: 'UI.DataField',
                Value: buyer,
                Label: '{i18n>UserID}',
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Total1}',
                Value: total,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>GeneralInformation}',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: OrderNo,
            Label: '{i18n>OrderNumber}',
        },
        {
            $Type: 'UI.DataField',
            Value: buyer,
            Label: '{i18n>UserID}',
        },
        {
            $Type: 'UI.DataField',
            Value: total,
            Label: '{i18n>Total}',
        },
    ],
    UI.SelectionFields           : [
        OrderNo,
        buyer,
        total
    ],
);


annotate CatalogService.Orders with {
    total  @Analytics.Measure  @Aggregation.default: #SUM
};

annotate CatalogService.Orders with @(Aggregation: {
    ApplySupported        : {
        $Type              : 'Aggregation.ApplySupportedType',
        GroupableProperties: [
            buyer,
            OrderNo
        ]
    },
    CustomAggregate #total: 'Edm.Decimal'
})
