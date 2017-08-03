package(default_visibility = ["//visibility:public"])

COPTS = [
    "-DFORMAT=\\\"float\\\"",
    "-DHAVE_BZERO=1",
    "-DHAVE_MEMSET=1",
    "-DHAVE_STRING_H=1",
    "-DHAVE_STRRCHR=1",
    "-DPACKAGE_VERSION=\\\"3.10\\\"",
    "-Iexternal/sptk/include",
]

genrule(
    name = "make_cplusplus_header",
    srcs = ["include/SPTK.h"],
    outs = ["sptk.h"],
    cmd = """
        echo 'extern "C" {' > $@
        egrep -v 'wavread|wavwrite' $< >> $@
        echo '}  // extern "C"' >> $@
    """,
)

cc_library(
    name = "sptk",
    srcs = [
        "bin/fft/_fft.c",
        "bin/fftr/_fftr.c",
        "bin/freqt/_freqt.c",
        "bin/ifftr/_ifftr.c",
        "bin/mcep/_mcep.c",
        "include/SPTK.h",
        "lib/agexp.c",
        "lib/cholesky.c",
        "lib/fileio.c",
        "lib/fillz.c",
        "lib/getfp.c",
        "lib/getmem.c",
        "lib/gexp.c",
        "lib/glog.c",
        "lib/invert.c",
        "lib/matrix.c",
        "lib/movem.c",
        "lib/mseq.c",
        "lib/theq.c",
        "lib/toeplitz.c",
    ],
    hdrs = [
        "sptk.h",
    ],
    copts = COPTS,
)

cc_binary(
    name = "mcep",
    srcs = ["bin/mcep/mcep.c"],
    copts = COPTS,
    deps = [":sptk"],
)

cc_binary(
    name = "sopr",
    srcs = ["bin/sopr/sopr.c"],
    copts = COPTS,
    deps = [":sptk"],
)

cc_binary(
    name = "x2x",
    srcs = ["bin/x2x/x2x.c"],
    copts = COPTS,
    deps = [":sptk"],
)