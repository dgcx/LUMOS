package testGame03;
public class P2SG extends	Page02{
	public	void	setUp() {
		normalFace="F:\\Download\\Java\\TestGame03\\images\\SG\\normal_sg.png";
		wayOfWork="�����ӵ�������";
		name="ˬ��";
		p1=new	People();
		p1.initial();
		p3w.nameOfPic="F:\\Download\\Java\\TestGame03\\images\\SG\\win_sg.jpg";
		String	r1="ˬ���𽥻��������ʽ���������";
		String	r2="����һ�ҽ��ӽ���ݡ��������һ������";
		String	r3="��ϲˬ�磡";
		p3w.showResult="<html><body>"+r1+"<br>"+r2+"<br>"+r3+"<body></html>";
		p3d.nameOfPic="F:\\Download\\Java\\TestGame03\\images\\SG\\sad_sg.jpg";
		String	r4="ˬ���㶼�����";
		String	r5="����һ�ֺ��ƣ����ϡ�á�";
		p3d.showResult="<html><body>"+r4+"<br>"+r5+"<body></html>";
		
		showState[1]="��ûѡ��۸�";
		showState[0]="ˬ��ճ����ž������˽�ͨ���ƣ������ų������ˡ�";
		showState[2]="ˬ�����ɽ��ʤ���������÷ǳ����С�";
		showState[3]="ˬ��Լ�������ֻ���˳��";
		showFace[1]=normalFace;
		showFace[0]=p3d.nameOfPic;
		showFace[2]="F:\\Download\\Java\\TestGame03\\images\\SG\\happy_sg.png";
		showFace[3]=showFace[2];
		
		showTitle="���׵�";
	}
	
}
