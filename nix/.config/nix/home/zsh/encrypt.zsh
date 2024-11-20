# utilizes the gpg subkeys on my yubikey to encrypt and decrypt files
gpg_keyid="FD9D50A0268288A2"

secret () {
  output=~/"${1}".$(date -Iseconds).enc
  gpg --encrypt --armor --output ${output} -r "${gpg_keyid}" "${1}" && \
    echo "${1} -> ${output}"
}

reveal () {
  output="${1%.enc}"
  gpg --decrypt --output "${output}" "${1}" && \
    echo "${1} -> ${output}"
}
