class mailcatcher::repo {

  include apt

  apt::source { 'cultuurnet-tools':
    location => 'http://apt.uitdatabank.be/tools-production',
    release  => $facts['lsbdistcodename'],
    repos    => 'main',
    key      => {
      'id'     => '2380EA3E50D3776DFC1B03359F4935C80DC9EA95',
      'source' => 'http://apt.uitdatabank.be/gpgkey/cultuurnet.gpg.key',
    },
    include  => {
      'src' => false,
      'deb' => true,
    }
  }

}
