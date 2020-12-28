res=
while [ -z "$res" ]; do
  echo $status
  status="$(shuf /home/loric/dotfiles/hpmor.txt -n 1)"
  res=$(curl "https://discordapp.com/api/v6/users/@me/settings" -H "authorization: Mzk4NTMwMTA2MTE0NzAzMzYw.Xo8uoA.IjSnpEiClFCcVdHNOqLU61QwRCM" -H "Content-type: application/json" -d '{"custom_status":{"text":"'"$status"'"}}' -X PATCH | jq '.custom_status.text' 2>/dev/null)
done
