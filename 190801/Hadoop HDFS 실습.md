## Hadoop HDFS 실습

> Tomcat의 모든 ACCESS LOG 파일을 하나의 파일(tomcat_access_log.txt)로 만들고 HDFS의 /edudata 폴더에 저장한다. 저장이 끝난 다음에는 저장된 파일의 사이즈를 화면에 표준 출력하고 종료한다.



1. Tomcat의 모든 ACCESS LOG 파일 하나로 합치기.

```java
public static final String PATH ="C:\......"
    File folder = new File(PATH);
		File[] listFile = folder.listFiles();
		BufferedReader in = null;
		
		PrintWriter out = new PrintWriter(new FileWriter(PATH+"/tomcat_access_log.txt"));

		String line = null;
		for (File file : listFile) {
			in = new BufferedReader(new FileReader(file));
			while ((line = in.readLine()) != null) {
				out.write(line);
				out.println();
				System.out.println(line);
			}
		}
		if (out != null) {
			try {
				out.close();
			} catch (Exception e) {
			}
		}
```



2. HDFS의 /edudata 폴더에 저장하고 사이즈 출력하기

```java
Configuration conf = new Configuration();
		conf.set("fs.defaultFS", "hdfs://192.168.111.120:9000");
		FileSystem hdfs = FileSystem.get(conf);
		
		String fname = "tomcat_access_log.txt";
		File f = new File(PATH+"/" + fname);
		if (!f.exists()) {
			System.out.println("파일이 없음!!");
			return;
		}
		Path path = new Path("/edudata/" + fname);
		if (hdfs.exists(path)) {
			hdfs.delete(path, true);
		}
		long size = f.length();
		FileReader fr = new FileReader(f);
		char[] content = new char[(int) size];
		fr.read(content);
		FSDataOutputStream outStream = hdfs.create(path);
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outStream));
		writer.write(content);
		writer.close();
		outStream.close();
		fr.close();
		System.out.println(size + " 크기의 데이터 출력 완료!!");
```



- URL(Uniform Resource Locator)
  - 네트워크 상에서 자원이 어디있는지를 알려주기 위한 규약

