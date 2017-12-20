class HomeController < ApplicationController
  def index
  end

  def lunch
	@lunch =["멀캠20층", "순남시래기", "명동칼국수",
	         "강남목장", "양자강" , "옛날농장" , "순두부"].sample
	@img_url = {"멀캠20층" => "https://scontent.cdninstagram.com/t51.2885-15/s320x320/sh0.08/e35/20987024_1431422050287339_2004189507347283968_n.jpg",
	 			"순남시래기" => "http://mblogthumb2.phinf.naver.net/20141025_85/yeoma86_1414239233821ujCoB_JPEG/IMG_5972.JPG?type=w2",
	 			"명동칼국수" => "http://cfile1.uf.tistory.com/image/2727EB4C567130C10E934A",
	 			 "강남목장" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoG7NUUrqVg4kKCwIadvmIpWXjcW-KLp4xUS2gZF4Sjpe04_YP2w",
	 			"양자강" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQImRSrRd0shi1nAcJcVn8hnYNxAhrYSUfG04Ytaj1KCWRavMc",
	 			"옛날농장" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq4krr1MkNz-y_B7bPGKpWRdo6bmqwWkoTMARyvePCowfwkacJnw"
	 		   }
	end

end
