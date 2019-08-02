## Hadoop Mapreduce   ![1564726417124](C:\Users\student\AppData\Roaming\Typora\typora-user-images\1564726417124.png)

> MapReduce는 구글에서 대용량 데이터 처리를 분산 병렬 컴퓨팅에서 처리하기 위한 목적으로 제작하여 2004년 발표한 소프트웨어 프레임워크다. 이 프레임워크는 페타바이트 이상의 대용량 데이터를 신뢰도가 낮은 컴퓨터로 구성된 클러스터 환경에서 병렬 처리를 지원하기 위해서 개발되었다.

![1564726407830](C:\Users\student\AppData\Roaming\Typora\typora-user-images\1564726407830.png)



### [Hadoop MapReduce 실습]

>  단어의 길이가 3자 이상 5자 이하인 단어의 개수 출력하기

1. wordCount.java

```java
package exercise1;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class WordCount {
	  public static void main(String[] args) throws Exception {
	    Configuration conf = new Configuration();
	    conf.set("fs.defaultFS", "hdfs://192.168.111.120:9000");
	   
	    Job job = Job.getInstance(conf);

	    job.setJarByClass(WordCount.class);
	    job.setMapperClass(WordCountMapper.class);
	    job.setReducerClass(WordCountReducer.class);

	    job.setInputFormatClass(TextInputFormat.class);
	    job.setOutputFormatClass(TextOutputFormat.class);

	    job.setOutputKeyClass(Text.class);
	    job.setOutputValueClass(IntWritable.class);

	    FileInputFormat.addInputPath(job, new Path("/edudata/fruit.txt"));
	    FileOutputFormat.setOutputPath(job, new Path("/output/exer_out1"));

	    job.waitForCompletion(true);
	    
	    System.out.println("SUCCESS");
	  }
	}


```

2. WordCountMapper.java

```java
package exercise1;

import java.io.IOException;

public class WordCountMapper extends Mapper<LongWritable, Text, Text, IntWritable> {
	private final static IntWritable one = new IntWritable(1);
	private Text word = new Text();

	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		StringTokenizer itr = new StringTokenizer(value.toString());
	
		
		while (itr.hasMoreTokens()) {
			String words = itr.nextToken();
			if(words.length()>=3 && words.length()<=5) {
				word.set(words);
				context.write(word, one);
			}
		}
	}
}

```

3. WordCountReducer.java

```java
package exercise1;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class WordCountReducer extends Reducer<Text, IntWritable, Text, IntWritable> {
	private IntWritable result = new IntWritable();

	public void reduce(Text key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {
		int sum = 0;
		
			for (IntWritable val : values) {
					sum += val.get();
			}
		
		result.set(sum);
		
		context.write(key, result);
	}
}

```

