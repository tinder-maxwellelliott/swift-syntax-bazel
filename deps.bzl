# buildozer: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def swift_syntax_deps():
    """Fetches dependencies of SwiftSyntax"""
    if not native.existing_rule("build_bazel_rules_swift"):
        fail("error: this depends on rules_swift but that wasn't setup")

    http_archive(
        name = "com_github_keith_lib_internalswiftsyntaxparser",
        sha256 = "5ea43b22df9ef6b2a8a286183804ebe798615067715282e46e704500b12934fd",
        urls = ["https://github.com/keith/lib_InternalSwiftSyntaxParser/releases/download/13.0.13A5154h/lib_InternalSwiftSyntaxParser.dylib.zip"],
        build_file_content = """
filegroup(
    name = "library",
    srcs = ["lib_InternalSwiftSyntaxParser.dylib"],
    visibility = ["@com_github_keith_swift_syntax//:__pkg__"],
)
""",
    )

    http_archive(
        name = "com_github_keith_swift_syntax",
        build_file = "@com_github_keith_swift_syntax_bazel//:SwiftSyntax.BUILD",
        sha256 = "e2e0a56af02f1aba5282f3947bb0236baa810df4b5265d059493fce1dc4dd652",
        strip_prefix = "swift-syntax-swift-5.5-DEVELOPMENT-SNAPSHOT-2021-07-16-a",
        url = "https://github.com/apple/swift-syntax/archive/refs/tags/swift-5.5-DEVELOPMENT-SNAPSHOT-2021-07-16-a.tar.gz",
    )
