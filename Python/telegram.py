import requests
#url
token='826183184:AAHv7uJKDMmwa_VN3Hz23cdTnOZAZus_kxs'
base_url = f'https://api.telegram.org/bot{token}'
#요청 내용
chat_id=921789944
text='안녕하세요'
url = f'{base_url}/sendMessage?chat_id={chat_id}&text={text}'
#요청 보내기
requests.get(url)