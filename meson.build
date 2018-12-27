    project('com.github.gsofianos.bumblebee', 'vala', 'c')

    compiler = meson.get_compiler('c')
    # Libm cannot be found with dependency()
    libm = compiler.find_library('m', required : true)

    bumblebee_sources = [
        'src/Main.vala',
        'src/Application.vala',

        'src/Enums/PlayerStatus.vala',

        'src/Core/Player.vala',
        'src/Core/PlayerDecoders/ASXDecoder.vala',
        'src/Core/PlayerDecoders/M3UDecoder.vala',
        'src/Core/PlayerDecoders/PLSDecoder.vala',

        'src/Models/Station.vala',
        'src/Models/WebRadio.vala',

        'src/Error.vala',
    ]

    bumblebee_deps = [
        dependency('gio-2.0', version: '>= 2.50'),
        dependency('gtk+-3.0', version: '>= 3.22'),
        dependency('gstreamer-1.0'),
        dependency('gee-0.8'),
        dependency('libsoup-2.4'),
        dependency('libxml-2.0'),
        libm
    ]


    executable(
        meson.project_name(),
        bumblebee_sources,
        dependencies: bumblebee_deps,
        vala_args: '--target-glib=2.50',
        install: true
    )

    install_data(
        join_paths('data', meson.project_name() + '.desktop'),
        install_dir: join_paths(get_option('datadir'), 'applications')
    )

    install_data(
        join_paths('data', meson.project_name() + '.appdata.xml'),
        install_dir: join_paths(get_option('datadir'), 'metainfo')
    )