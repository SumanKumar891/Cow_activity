void fetchDataAndDownload() async {
  final url = Uri.parse('https://wcelyqvyi7.execute-api.us-east-1.amazonaws.com/deployment/cow?deviceId=120&starttime=1688132921&endtime=1688133222');  // Replace with your API endpoint

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = response.body;
    const fileName = 'cow_data.json'; // Specify the file name and extension

    final anchor = html.AnchorElement(href: 'data:text/plain;charset=utf-8,${Uri.encodeComponent(jsonData)}')
      ..setAttribute('download', fileName)
      ..click();
    print(jsonData);
  } else {
    print('Error: ${response.statusCode}');
  }
}