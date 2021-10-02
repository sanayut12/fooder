import 'package:fooder/function/dataManagement/dataLanguageManagement.dart';

Map<String, Map<String, String>> list_how_send = {
  '1': {'th': 'ส่งถึงที่', 'en': ''},
  '2': {'th': 'รับที่ร้าน', 'en': ''},
  '3': {'th': 'ส่งถึงที่/รับที่ร้าน', 'en': ''}
};

String HowSendText(String no, String language) {
  LanguageManagement lgm = LanguageManagement();

  if (no == '1') {
    return lgm.value('039', language);
  } else if (no == '2') {
    return lgm.value('040', language);
  } else {
    return lgm.value('039', language) + '/' + lgm.value('040', language);
  }
  // return list_how_send[no][language];
}
