*** Settings ***
Documentation     This is a sample test suite using Robot Framework
Library           SeleniumLibrary
# Suite Setup       Open Browser    http://automationexercise.com  chrome

*** Variables ***
${$url}    http://automationexercise.com
${title}    automationexercise
${name}  Testfern
${email}   Farnji77@gmail.com
${subject}  ระบบขัดข้อง
${message}  กดของใส่ตะกร้าไม่ได้
${btnSelectWordfile}    //*[@id="contact-us-form"]/div[5]/input
${imgFile}              1_137.jpg

*** Keywords ***
Open Browser Test
   Open Browser    ${$url} Browser

Verify automationexercise
    [Arguments]                ${title}
    Title Should Be            ${title}

Clike Contact Element
  Click Element             //*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a

Input name
    [Arguments]  ${name}
    Input Text    //*[@name="name"]    ${name}

Input email
    [Arguments]  ${email}
    Input Text    //*[@name="email"]    ${email}

Input subject
    [Arguments]  ${subject}
    Input Text    //*[@name="subject"]    ${subject}

Input message
    [Arguments]  ${message}
    Input Text    //*[@name="message"]    ${message}

Upload file
    Wait Until Page Contains Element   ${btnSelectWordfile}
    Choose File     ${btnSelectWordfile}     ${imgFile}

Clike Submit Button
  Click Button             //*[@id="contact-us-form"]/div[6]/input



*** Test Cases ***
Home page with valid info
   [Documentation]    Verify that home page is visible successfully
   Open Browser     about:blank    chrome
   Go To        ${$url}
   Clike Contact Element
   Input name  ${name}
   Input email  ${email}
   Input subject  ${subject}
   Input message  ${message}
   Choose File    ${btnSelectWordfile}  ${CURDIR}${/}${imgFile}

   Clike Submit Button 


# Register with valid info
#    [Documentation]    Test the login functionality with valid credentials
#    Click Register Element
   
#    Input email                  ${email}
#    Input name                   ${name}
#    Input lastName               ${lastName}
#    Input PhoneNumber            ${PhoneNumber}
#    Input nemPassword            ${password}
#    Input confirmPassword        ${password}
   
#    Checked Checkbox 
#    Click Register Button
#    Page Should Contain Element  //*[@id="__next"]/div[2]/div/div[2]/h6[1]
