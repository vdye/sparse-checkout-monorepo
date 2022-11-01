load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    deps = [
        "//libcore:hello-time",
        "//libshared:hello-greet",
    ],
)
