## Task 1

### Myntra Automation using Robot Framework

#1. Launch the browser (Chrome) and navigate to Myntra https://www.myntra.com/
#2. Maximize the browser window for better visibility.
#3. Hover the mouse over the Women section in the top navigation menu.
#4. Click on the Lehenga Choli category.
#5. Once the product listing page is loaded, scroll down to the filter section.
#6. Locate and select the Blue or your fav color filter option.
#7. Store the name/text of a specific product (e.g., Madhuram Floral Embroidered Choli with Skirt).
#8. Print the captured product name in the console.
#9. Close the browser.

*** Settings ***
Documentation  tasks
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.myntra.com/

*** Test Cases ***
Tasks
    Open Browser  ${url}  chrome
    Maximize Browser Window

    Mouse Over    xpath=//a[@data-group="women"]
    Sleep    2s

    Click Element    xpath=//a[text()="Lehenga Cholis"]

    Scroll Element Into View    xpath=//span[text()="Color"]
    Sleep    2s

    Click Element    xpath=(//label[@class="common-customCheckbox"])[1]
    Sleep    2s

    ${product}=    Get Text    xpath=//div[@class="product-productMetaInfo"]/child::h4[1]

    Log To Console    Product Name: ${product}

    Close Browser
