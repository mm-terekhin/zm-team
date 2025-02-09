class GetLinkResponseDto {
  const GetLinkResponseDto({
    required this.part1,
    required this.part2,
    required this.exception,
    required this.message,
  });

  const GetLinkResponseDto.empty()
      : part1 = null,
        part2 = null,
        exception = null,
        message = null;

  factory GetLinkResponseDto.fromJson(Map<String, dynamic> json) =>
      GetLinkResponseDto(
        part1: json['part1'],
        part2: json['part2'],
        exception: json['exception'],
        message: json['message'],
      );

  bool get isEmpty => part1 == null || part2 == null;

  Uri get toUri {
    if (isEmpty) {
      throw ArgumentError();
    }

    return Uri.parse('https://$part1$part2');
  }

  final String? part1;
  final String? part2;
  final String? exception;
  final String? message;
}
