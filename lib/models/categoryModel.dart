// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);




class CategoryModel {
    CategoryModel({
        this.data,
        this.next,
        this.currentPage,
        this.hasMorePages,
        this.links,
        this.meta,
    });

    List<Datum> data;
    dynamic next;
    int currentPage;
    bool hasMorePages;
    Links links;
    Meta meta;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        next: json["next"],
        currentPage: json["currentPage"],
        hasMorePages: json["hasMorePages"],
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "next": next,
        "currentPage": currentPage,
        "hasMorePages": hasMorePages,
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class Datum {
    Datum({
        this.id,
        this.title,
        this.image,
    });

    int id;
    String title;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}

class Links {
    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    String first;
    String last;
    dynamic prev;
    dynamic next;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    int currentPage;
    int from;
    int lastPage;
    String path;
    int perPage;
    int to;
    int total;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}
