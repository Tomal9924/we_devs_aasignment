import 'categories.dart';
import 'dimensions.dart';
import 'image.dart';
import 'store.dart';
import 'tags.dart';

class Product {
  late final int id;
  late final String name;
  late final String slug;
  late final String postAuthor;
  late final String permalink;
  late final String dateCreated;
  late final String dateCreatedGmt;
  late final String dateModified;
  late final String dateModifiedGmt;
  late final String type;
  late final String status;
  late final bool featured;
  late final String catalogVisibility;
  late final String description;
  late final String shortDescription;
  late final String sku;
  late final String price;
  late final String regularPrice;
  late final String salePrice;
  late final String dateOnSaleFrom;
  late final String dateOnSaleFromGmt;
  late final String dateOnSaleTo;
  late final String dateOnSaleToGmt;
  late final String priceHtml;
  late final bool onSale;
  late final bool purchasable;
  late final int totalSales;
  late final bool virtual;
  late final bool downloadable;
  late final int downloadLimit;
  late final int downloadExpiry;
  late final String externalUrl;
  late final String buttonText;
  late final String taxStatus;
  late final String taxClass;
  late final bool manageStock;
  late final double stockQuantity;
  late final bool inStock;
  late final String backorders;
  late final bool backordersAllowed;
  late final bool backordered;
  late final bool soldIndividually;
  late final String weight;
  late final Dimensions dimensions;
  late final bool shippingRequired;
  late final bool shippingTaxable;
  late final String shippingClass;
  late final int shippingClassId;
  late final bool reviewsAllowed;
  late final String averageRating;
  late final int ratingCount;
  late final int parentId;
  late final String purchaseNote;
  late final List<Categories> categories;
  late final List<Tags> tags;
  late final List<Images> images;
  late final int menuOrder;
  late final Store store;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    postAuthor = json['post_author'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    priceHtml = json['price_html'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    externalUrl = json['external_url'];
    buttonText = json['button_text'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    inStock = json['in_stock'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = Dimensions.fromJson(json['dimensions']);
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    tags = List.from(json['tags']).map((e) => Tags.fromJson(e)).toList();
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    menuOrder = json['menu_order'];
    store = Store.fromJson(json['store']);
  }
}
