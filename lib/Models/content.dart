import 'dart:convert';

class Content<T> {
  T items;
  int total;
  int page;
  int perPage;
  int totalPages;

  Content({
    required this.items,
    required this.total,
    required this.page,
    required this.perPage,
    required this.totalPages,
  });

  Content<T> copyWith({
    T? items,
    int? total,
    int? page,
    int? perPage,
    int? totalPages,
  }) {
    return Content<T>(
      items: items ?? this.items,
      total: total ?? this.total,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
      'total': total,
      'page': page,
      'perPage': perPage,
      'totalPages': totalPages,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content<T>(
      items: map['items'] as T,
      total: map['total'] as int,
      page: map['page'] as int,
      perPage: map['perPage'] as int,
      totalPages: map['totalPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Content(items: $items, total: $total, page: $page, perPage: $perPage, totalPages: $totalPages)';
  }

  @override
  bool operator ==(covariant Content<T> other) {
    if (identical(this, other)) return true;

    return other.items == items &&
        other.total == total &&
        other.page == page &&
        other.perPage == perPage &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode {
    return items.hashCode ^ total.hashCode ^ page.hashCode ^ perPage.hashCode ^ totalPages.hashCode;
  }
}
