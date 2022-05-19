<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>�۽��� ������</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link href="main.css" id="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="layout-container" style="max-width: 1000px">
      <!-- ���̵� �޴� �� -->
      <div
        class="side_menu"
        id="menu"
        style="
          width: 200px;
          height: 100%;
          position: fixed;
          background-color: lightgray;
          text-align: center;
        "
      >
        <!-- ������ �ΰ� -->
        <div class="logo">
          <a href="index.html">
            <img src="imgs/logo.jpg" alt="logo" style="width: 100%" />
          </a>
        </div>

        <!-- ������ -->
        <div class="profile_img">
          <img
            src="imgs/profile_ex.jpg"
            alt="profile_img"
            style="
              height: 100px;
              width: 100px;
              border-radius: 50px;
              margin-top: 50px;
            "
          />
        </div>
        <br>
        <!-- ���� -->
        <div class="motto">
          <p>
            OOO��
            <br>
            n�� ° �湮�� ȯ���մϴ�.
          </p>
          <p">�������� ���� ���� �١�</p>
        </div>

        <!-- �޴� -->
        <ul
          style="
            list-style-type: none;
            background-color: lightyellow;
            text-align: center;
            display: inline-flexbox;
            position: relative;
            text-align: left;
            margin-top: 50px;
          "
        >
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="personal_data.html" style="text-decoration: none;"><li>�۽��� ������</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="group_data.html" style="text-decoration: none"><li>�׷� ������</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="crew.html" style="text-decoration: none"><li>ũ�� ����</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="bulletin_board.html" style="text-decoration: none"><li>�����Խ���</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="faq.html" style="text-decoration: none"><li>�̿� ����</li></a>
          </div>
        </ul>
      </div>

      <!-- nav�� �ش�, ��� ������ ����, ���� x -->
      <!-- Q. �α���, ȸ������ �۾� Ű��� ���? -->
      <div class="nav" style="position:relative; left:180px; justify-content: end">
        <div class="end" name="login">
          <a href="login.html" style="text-decoration: none">�α���</a>
        </div>
        &nbsp;&nbsp;
        <div class="end" name="enroll">
          <a href="enrollment.html" style="text-decoration: none">ȸ������</a>
        </div>
      </div>

      <!-- Q. side_menu�� ������ �������� page�� ������ �� �ֵ��� �����ϴ� ���? -->
      <!-- ������ �κ� -->
      <div
        id="index"
        style="
          position: relative;
          left: 200px;
          background-color: none;
          position: flex;
        "
      >
        <!-- ������ ���� ���� -->
        <div class="container" style="left: 200px; width: 90%">
          <!-- ������ �̸� -->
          <div>
            <h1>�۽��� ������</h1>
          </div>

          <!-- ��� ��� -->
          <div class="row">
            <h3>���� ��� ��� : 
              <script>
                date = new Date();
                year = date.getFullYear();
                month = date.getMonth() + 1;
                day = date.getDate();
                document.write(year+"�� "+month+"�� "+day+"��");
              </script>
            </h3>
            <div class="row" style="margin:auto;">
              <div class="col-sm-3">
                <input type="image" alt="�������� ���ε�" />
                  <button href="#" class="btn btn-secondary">���� ���ε�</button>
              </div>
              <div class="col-sm-9">
                <div class="row">
                  <div class="row">
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="���� ü��">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <button href="#" class="btn btn-primary">���</button>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-floating col-sm-10">
                    <textarea name="" id="" cols="40" rows="10" class="form-control" placeholder="�/�Ĵ�/��� ��" style="resize:none;"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- �ܵ��� �׷��� -->
          <div class="row">
            <h3>�ܵ� �׷���</h3>
            <div class="row" style="margin:auto;">
              <!-- C.�̹��� �������� ��ü�ؾ� �� -->
              <img src="imgs/grass_graph.PNG" alt="�ܵ� �׷���" />
            </div>
          </div>

          <!-- �ְ� ��� Ȯ��  -->
          <div class="row">
            <h3>�ְ� ���</h3>
            <div class="row" style="margin:auto; text-align: center;">
              <table>
                <tr>
                  <th>����</th>
                  <th>��</th>
                  <th>ȭ</th>
                  <th>��</th>
                  <th>��</th>
                  <th>��</th>
                  <th>��</th>
                  <th>��</th>
                </tr>
                <tr>
                  <th>���� ���</th>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="���" style="width:100px"/></td>
                </tr>
                <tr>
                  <th>���</th>
                  <td>70.2kg</td>
                  <td>74.2kg</td>
                  <td>70.9kg</td>
                  <td>70.8kg</td>
                  <td>70.6kg</td>
                  <td>70.2kg</td>
                  <td>70.4kg</td>
                </tr>
              </table>
            </div>
          </div>

          <!-- �Ʒ� ���� -->
          <div class="row">
            <h3>ü�� ��ȭ �׷���</h3>
            <div class="row" style="margin:auto;">
              <img src="/Back-end/JSP website/imgs/grass_graph.PNG" alt="ü�� ��ȭ �׷���" />
            </div>
          </div>
          <div class="row">
            <h3>���ε� ���</h3>
          </div>
          <div class="row">
            <table class="table" style="text-align: center;">
              <tr>
                <th>��ȣ</th><th>��¥</th><th>���</th><th>���ӱ��</th><th>�󼼺���</th>
              </tr>
              <!-- C.���ڵ�� ��ɿ� ���� ����/���� ��ȯ -->
              <!-- Q. 5/18 HELP �ʿ� -->
              <tr>
                <td>4</td><td>2022/5/5</td><td>70kg</td></td><td>1����</td>
                <td>
                  <a href="" id="seeDetails" style="text-decoration:none;" data-bs-toggle="collapse" data-bs-target="#details" aria-controls="details">
                    ����
                  </a>
                  <tr>
                    <td colspan="2">���� <img src="" alt=""></td><td colspan="2">�޸� <p>�޸� �����Դϴ�</p></td><td></td>
                  </tr>
                </td>
              </tr>
              <tr>
                <td>3</td><td>2022/5/3</td><td>70kg</td></td><td>3����</td><td><a href="#" style="text-decoration:none;">����</a></td>
              </tr>
              <tr>
                <td>2</td><td>2022/5/2</td><td>70kg</td></td><td>2����</td><td><a href="#" style="text-decoration:none;">����</a></td>
              </tr>
              <tr>
                <td>1</td><td>2022/5/1</td><td>70kg</td></td><td>1����</td><td><a href="#" style="text-decoration:none;">����</a></td>
              </tr>
            </table>
            <div class="row text-center" style="font-size: 20px; margin:auto;">
              <p>
                <a href="" style="text-decoration: none"><</a>
                <a href="" style="text-decoration: none">1</a>
                <a href="" style="text-decoration: none">2</a>
                <a href="" style="text-decoration: none">3</a>
                <a href="" style="text-decoration: none">4</a>
                <a href="" style="text-decoration: none">5</a>
                <a href="" style="text-decoration: none">></a>
              </p>
            </div>
        </div>
      </div>
    </div>
  </body>
</html>
