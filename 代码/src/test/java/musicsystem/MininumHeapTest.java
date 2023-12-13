package musicsystem;

import top.stu.musicsystem.algorithm.MininumHeap;
import top.stu.musicsystem.algorithm.TreeNode;

public class MininumHeapTest {
	
	
	public static void main(String[] args) {
		int k=5;
		MininumHeap mininumHeap=new MininumHeap(k);
		
		for(int i=0;i<10;i++) {
			TreeNode node=new TreeNode(i,i);
			mininumHeap.addElement(node);
		}
		
		for(int i=0;i<k;i++) {
			System.out.println(mininumHeap.getArray()[i].val);
		}
	}

}
