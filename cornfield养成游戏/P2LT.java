package testGame03;

public class P2LT extends	Page02{
	public	void	setUp() {
		normalFace="F:\\Download\\Java\\TestGame03\\images\\LT\\normal_LT.jpg";
		wayOfWork="��������ש";
		name="����";
		p1=new	People();
		p1.initial();
		p3w.nameOfPic="F:\\Download\\Java\\TestGame03\\images\\LT\\win_LT.jpg";
		String	r1="�������յĻ��ۣ�";
		String	r2="������ɽ��14������8000�����ϵĸ߷塣";
		String	r3="�˳ơ���ʮ�ġ���";
		p3w.showResult="<html><body>"+r1+"<br>"+r2+"<br>"+r3+"<body></html>";
		p3d.nameOfPic="F:\\Download\\Java\\TestGame03\\images\\LT\\sad_LT.jpg";
		String	r4="�����㶼�����";
		String	r5="����һ�ֺ��ƣ����ϡ�á�";
		p3d.showResult="<html><body>"+r4+"<br>"+r5+"<body></html>";
		
		showState[1]="��ûѡ��۸�";
		showState[0]="��ʦͻȻ��绰�������������ǳ�����";
		showState[2]="��������һ����Ϸ";
		showState[3]="����r������һ����Ȥ��ͽ����·";
		showFace[1]=normalFace;
		showFace[0]=p3d.nameOfPic;
		showFace[2]="F:\\Download\\Java\\TestGame03\\images\\LT\\happy_LT.jpg";
		showFace[3]=showFace[2];
		
		showTitle="���׵�";
		
	}
	
}

