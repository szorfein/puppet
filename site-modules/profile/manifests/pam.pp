class profile::pam {

  include pkgs::pam

  notice("Enforce policy for PAM")

  # Force to use a better password:
  # Minimum of 12 characters (minlen)
  # 6 different characters from the old password (difok),
  # At least 2 digits (dcredit),
  # At least 2 uppercase (ucredit),
  # At least 2 lowercase (lcredit) and at least 2 other characters (ocredit)
  file_line { 'pam_pwquality':
    path  => '/etc/pam.d/passwd',
    match => '^password\ required\ pam_pwquality.so',
    line  => 'password required pam_pwquality.so retry=2 minlen=12 difok=6 dcredit=-2 ucredit=-2 lcredit=-2 ocredit=-2 enforce_for_root'
  }

  file_line { 'pam_sha512':
    path  => '/etc/pam.d/passwd',
    match => '^password\ required\ pam_unix.so',
    line  => 'password required pam_unix.so use_authtok sha512 shadow'
  }
}
