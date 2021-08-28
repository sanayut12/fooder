Map<String, Map<String, String>> list_how_send = {
  '1': {'th': 'ส่งถึงที่', 'en': ''},
  '2': {'th': 'รับที่ร้าน', 'en': ''},
  '3': {'th': 'ส่งถึงที่/รับที่ร้าน', 'en': ''}
};

String HowSendText(String no, String language) {
  return list_how_send[no][language];
}
