## Task 2

### Vogue.in automation using python selenium

# 1. Navigate to https://www.vogue.in/
# 2. Click on Shopping category
# 3. Scroll to Olive Crest (Wings) product and click on it
# 4. New tab opens switch to the new window
# 5. Fetch me the {name:price}

from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Chrome()
driver.maximize_window()
wait = WebDriverWait(driver, 15)

driver.get("https://www.vogue.in/")
actions=ActionChains(driver)

shopping = wait.until(EC.element_to_be_clickable((By.XPATH, '//a[contains(text(),"Shopping")]')))
shopping.click()

product = wait.until(EC.presence_of_element_located((By.ID, '69845d11f76d9d30fc58a64a')))
actions.scroll_to_element(product)
product.click()

windows = driver.window_handles
driver.switch_to.window(windows[1])

name = wait.until(EC.presence_of_element_located((By.XPATH, '//h1'))).text

price = wait.until(EC.presence_of_element_located((By.XPATH, '(//span[@class="money buckscc-money"])[1]'))).text

print({name: price})

driver.quit()