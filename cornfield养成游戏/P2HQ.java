package testGame03;

public class P2HQ extends	Page02{
	public	void	setUp() {
		normalFace="F:\\Download\\Java\\TestGame03\\images\\HQ\\normal_hq.png";
		wayOfWork="����������׬���";
		name="����";
		p1=new	People();
		p1.initial();
		p3w.nameOfPic="F:\\Download\\Java\\TestGame03\\images\\HQ\\win_hq.png";
		String	r1="��������ŵ��������ѧ����";
		String	r2="һ��ר��Ϊ���ķ�����Ʒ�����Ľ��";
		String	r3="���ǿ�ɽ֮�٣�";
		p3w.showResult="<html><body>"+r1+"<br>"+r2+"<br>"+r3+"<body></html>";
		p3d.nameOfPic="F:\\Download\\Java\\TestGame03\\images\\HQ\\sad_hq.png";
		String	r4="���������ȥ�ˡ�";
		String	r5="����һ�ֺ��ƣ����ϡ�á�";
		p3d.showResult="<html><body>"+r4+"<br>"+r5+"<body></html>";
		
		showState[1]="��ûѡ��۸�";
		showState[0]="����Ÿ����U��ը��";
		showState[2]="���쿴��һ���ÿ��ĵ�Ӱ";
		showState[3]="��һ����ѩ�����ϣ��������ڲ���������һ������";
		showFace[1]=normalFace;
		showFace[0]=p3d.nameOfPic;
		showFace[2]="F:\\Download\\Java\\TestGame03\\images\\HQ\\happy_hq.png";
		showFace[3]=showFace[2];
		
		showTitle="���׵�";
	}
	
}

