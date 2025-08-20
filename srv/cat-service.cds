using {sap.capire.bookshop as my} from '../db/schema';

service CatalogService {

    @readonly
    entity Books   as projection on my.Books;

    @readonly
    entity Authors as projection on my.Authors;
}

annotate CatalogService.Books with @UI: {LineItem: [
    {Value: title},
    {Value: descr},
    {Value: stock},
    {Value: price},
    {Value: currency_code}
]};
