project('com.github.bartzaalberg.python-tester', 'vala', 'c')

gnome = import('gnome')
i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

asresources = gnome.compile_resources(
    'as-resources', 'data/app.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

executable(
    meson.project_name(),
    'src/Application.vala',
    'src/MainWindow.vala',
    'src/Location.vala',
    'src/Item.vala',
    'src/Constants.vala',
    'src/Player.vala',
    'src/TextHelper.vala',
    'src/Locations.vala',
    'src/StackManager.vala',
    'src/Items.vala',
    'src/Views/WelcomeView.vala',
    'src/Views/CommandsView.vala',
    'src/CommandLister.vala',
    'src/CommandLogRow.vala',
    'src/InputReactor.vala',
    asresources,
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gtksourceview-3.0'),
        dependency('granite')
    ],
    install: true
)

subdir('data')
subdir('po')

python3 = import('python3').find_python()
run_command(python3, '-c', 'import shutil; shutil.copy("hooks/pre-commit.hook", ".git/hooks/pre-commit")')
