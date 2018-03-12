project('com.github.arshubham.urutau-icon-pack', 'vala', 'c',
    version : '0.1.0',
    license: 'GPL-3.0'
)

gnome = import('gnome')

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

c_args = [
  '-include', 'config.h'
]

subdir('src')

asresources = gnome.compile_resources(
  'as-resources', 'data/' + meson.project_name() + '.gresource.xml',
  source_dir: 'data',
  c_name: 'as'
)

executable(meson.project_name(),
    sources,
    asresources,
    c_args: c_args,
    dependencies: [
        dependency('granite'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0'),
        dependency('glib-2.0'),
        dependency('gee-0.8'),
        meson.get_compiler('vala').find_library('posix')
    ],
    install : true
)

subdir('data')
