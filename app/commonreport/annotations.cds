using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Title}',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Descr}',
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Genreid}',
                Value: genre_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Stock2}',
                Value: stock,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Price2}',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Currencycode}',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Rating}',
                Value: rating,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Isbn}',
                Value: ISBN,
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
            Label: '{i18n>Title}',
            Value: title,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : '{i18n>Description}',
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Stock}',
            Value: stock,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Price}',
            Value: price,
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
            Label : '{i18n>Currency}',
        },
    ],
    UI.SelectionFields : [
        title,
        genre_ID,
        price,
        stock,
    ],
);

annotate service.Books with {
    author @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Authors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: author_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'dateOfBirth',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'dateOfDeath',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'placeOfBirth',
            },
        ],
    }
};
annotate service.Books with {
    title @Common.Label : '{i18n>Title}'
};

annotate service.Books with {
    genre @Common.Label : '{i18n>Genreid}'
};

annotate service.Books with {
    price @Common.Label : '{i18n>Price1}'
};

annotate service.Books with {
    stock @Common.Label : '{i18n>Stock1}'
};

