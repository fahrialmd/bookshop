using {
    Currency,
    managed,
    sap,
    cuid,
    User,
} from '@sap/cds/common';

namespace sap.capire.bookshop;

// Technical
type TechnicalBooleanFlag : Boolean @(
    UI.Hidden,
    Core.Computed
);

// Entity for books
entity Books : cuid, managed {
    title        : localized String(111);
    descr        : localized String(1111);
    author       : Association to Authors;
    genre        : Association to Genres;
    stock        : Integer;
    price        : Decimal(9, 2);
    currency     : Currency;
    rating       : Decimal(2, 1);
    ISBN         : String(50);
    isReviewable : TechnicalBooleanFlag not null default true;
}

// Entity for authors
entity Authors : cuid, managed {
    @assert.format: '^\p{Lu}.*'
    name         : String(111);
    dateOfBirth  : Date;
    dateOfDeath  : Date;
    placeOfBirth : String;
    placeOfDeath : String;
    books        : Association to many Books
                       on books.author = $self;
}

// Global annotation for entity authors
annotate Authors with
@PersonalData                        : {
    DataSubjectRole: 'Author',
    EntitySemantics: 'DataSubject'
} {
    ID   @PersonalData.FieldSemantics: 'DataSubjectID';
    name @PersonalData.IsPotentiallySensitive;
}

/** Hierarchically organized Code List for Genres */
entity Genres : sap.common.CodeList {
    key ID       : Integer;
        parent   : Association to Genres;
        children : Composition of many Genres
                       on children.parent = $self;
}

// Entity for orders
entity Orders : cuid, managed {
    OrderNo  : String        @title: '{i18n>OrderNumber}'  @mandatory; //> readable key
    Items    : Composition of many OrderItems
                   on Items.parent = $self;
    buyer    : User;
    total    : Decimal(9, 2) @readonly;
    currency : Currency;
}

// Entity for order items
entity OrderItems : cuid {
    parent   : Association to Orders;
    book     : Association to Books  @mandatory  @assert.target;
    quantity : Integer;
    amount   : Decimal(9, 2);
    currency : Currency;
}

entity Currencies : sap.common.CodeList {
    key code      : String(3) @(title: '{i18n>CurrencyCode}');
        symbol    : String(5) @(title: '{i18n>CurrencySymbol}');
        minorunit : Int16     @(title: '{i18n>CurrencyMinorUnit}');
}
