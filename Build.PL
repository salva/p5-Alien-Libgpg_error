use 5.006;
use strict;
use warnings;
use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild
    ->new( module_name          => 'Alien::Libgpg_error',
           license              => 'perl',
           dist_author          => q{Salvador Fandiño <sfandino@yahoo.com>},
           dist_version_from    => 'lib/Alien/Libgpg_error.pm',
           configure_requires   => { 'Alien::Base' => '0.024', },
           build_requires       => { 'Test::More' => 0 },
           add_to_cleanup       => [ 'Alien-Libgpg_error-*' ],
           alien_name           => 'libgpg-error',
           alien_repository     => { protocol => 'ftp',
                                     host => 'ftp.gnupg.org',
                                     location => '/gcrypt/libgpg-error/',
                                     pattern => qr/^libgpg-error-(\d+\.\d+)\.tar\.gz$/ },
           alien_msys           => 1,
           alien_stage_install  => 1,
           alien_build_commands => [ '%c --prefix=%s --disable-doc --disable-languages',
                                     '%x ../../helpers/fix-makefile.pl',
                                     'make' ],
                                   );

$builder->create_build_script();
