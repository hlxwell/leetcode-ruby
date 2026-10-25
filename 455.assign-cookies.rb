kids = [1, 3]
cookies = [1,1]

def find_content_children(kids, cookies)
  cookies.sort!
  kids.sort!
  contented_kids = 0
  kids.each do |kid|
    cookies.each_with_index do |cookie, index|
      if cookie >= kid
        cookies.delete_at index
        contented_kids += 1
        break
      end
    end
  end
  contented_kids
end

p find_content_children kids, cookies